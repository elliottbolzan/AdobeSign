//
//  Manager.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import KeychainSwift
import Alamofire
import WebKit
import SafariServices

class Login {

    func login(completion: ((Bool, AdobeSignError?) -> Void)?) {
        let browser = Browser(url: Sign.manager.loginURL(), title: "Login", pageChanged: { url, browser in
            if url.absoluteString.hasPrefix(Sign.configuration.redirectURL) {
                self.processCode(url: url, sender: browser, completion: completion)
            }
        })
        browser.show()
    }

    func processCode(url: URL, sender: Browser, completion: ((Bool, AdobeSignError?) -> Void)?) {
        guard let components = URLComponents(string: url.absoluteString), let queryItems = components.queryItems else {
            return
        }
        if url.absoluteString.contains("error") {
            sender.hide()
            completion?(false, AdobeSignError.responseFailure(message: "The server returned an error."))
            return
        }
        var code: String?
        for item in queryItems {
            let value = item.value ?? ""
            if item.name == "code" {
                code = value
            }
            else if item.name == "api_access_point" {
                Sign.manager.accessPoint = value
            }
        }
        Sign.manager.getAccessToken(code: code ?? "", completion: completion!, action: { sender.hide() } )
    }
    
}

open class Manager {

    static let ACCESS_TOKEN_KEY = "adobe_sign_access_token"
    static let REFRESH_TOKEN_KEY = "adobe_sign_refresh_token"
    static let ACCESS_POINT_KEY = "adobe_sign_access_point"
    static let ACCESS_POINT_DEFAULT = "https://api.na2.echosign.com/"

    let keychain = KeychainSwift()

    open var accessToken: String? {
        set { keychain.set(newValue ?? "", forKey: Manager.ACCESS_TOKEN_KEY) }
        get { return keychain.get(Manager.ACCESS_TOKEN_KEY) }
    }

    var refreshToken: String? {
        set { keychain.set(newValue ?? "", forKey: Manager.REFRESH_TOKEN_KEY) }
        get { return keychain.get(Manager.REFRESH_TOKEN_KEY) }
    }

    var accessPoint: String? {
        set { keychain.set(newValue ?? "", forKey: Manager.ACCESS_POINT_KEY) }
        get { return keychain.get(Manager.ACCESS_POINT_KEY) ?? Manager.ACCESS_POINT_DEFAULT }
    }

    func clear() {
        accessToken = nil
        refreshToken = nil
    }

    func headers() -> [String : String] {
        return ["Access-Token" : accessToken ?? ""]
    }

    func loginURL() -> URL {
        let parameters = [
            "redirect_uri" : Sign.configuration.redirectURL,
            "response_type" : "code",
            "client_id" : Sign.configuration.clientID,
            "scope" : Sign.configuration.permissions
        ]
        var components = URLComponents()
        components.scheme = "https";
        components.host = Sign.configuration.loginHost
        components.path = "/public/oauth";
        components.setParameters(parameters: parameters)
        return components.url!
    }

    func authenticate(completion: ((Bool, AdobeSignError?) -> Void)?) {
        if Sign.configuration.notSet() {
            completion?(false, AdobeSignError.configuration())
            return
        }
        guard let refreshToken = refreshToken, refreshToken != "", let _ = accessPoint else {
            Login().login(completion: completion)
            return
        }
        refresh(completion: { success in
            if success {
                completion?(true, nil)
                return
            }
            Login().login(completion: completion)
        })
    }

    func getAccessToken(code: String, completion: @escaping (Bool, AdobeSignError?) -> Void, action: @escaping () -> Void) {
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        let parameters = [
            "code" : code,
            "client_id" : Sign.configuration.clientID,
            "client_secret" : Sign.configuration.secret,
            "redirect_uri" : Sign.configuration.redirectURL,
            "grant_type" : "authorization_code"
        ]
        var components = URLComponents(string: accessPoint!)!
        components.path = "/oauth/token"
        components.setParameters(parameters: parameters)
        Alamofire.request(components.url!, method: .post, headers: headers).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                completion(false, AdobeSignError.responseFailure(message: response.result.error.debugDescription))
                return
            }
            guard let value = response.result.value as? [String: Any] else {
                completion(false, AdobeSignError.mangledJSON(response: response.result.value))
                return
            }
            self.accessToken = value["access_token"] as? String
            self.refreshToken = value["refresh_token"] as? String
            action()
            completion(true, nil)
        }
    }

    func refresh(completion: @escaping (Bool) -> Void) {
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        let parameters = [
            "grant_type" : "refresh_token",
            "client_id" : Sign.configuration.clientID,
            "client_secret" : Sign.configuration.secret,
            "refresh_token" : refreshToken ?? ""
        ]
        var components = URLComponents(string: accessPoint!)!
        components.path = "/oauth/refresh"
        components.setParameters(parameters: parameters)
        Alamofire.request(components.url!, method: .post, headers: headers).validate().responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                completion(false)
                return
            }
            guard let value = response.result.value as? [String: Any] else {
                completion(false)
                return
            }
            self.accessToken = value["access_token"] as? String
            completion(true)
        }
    }

    func logout(completion: ((AdobeSignError?) -> Void)?) {
        if Sign.configuration.notSet() {
            completion?(AdobeSignError.configuration())
            return
        }
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        let parameters = [
            "token" : accessToken ?? "",
        ]
        var components = URLComponents(string: accessPoint!)!
        components.path = "/oauth/revoke"
        components.setParameters(parameters: parameters)
        Alamofire.request(components.url!, method: .post, headers: headers).validate().response { (response) -> Void in
            self.clear()
            completion?(nil)
        }
    }

}
