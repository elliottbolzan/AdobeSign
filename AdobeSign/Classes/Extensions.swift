//
//  Extensions.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/30/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

extension URLComponents {
    mutating func setParameters(parameters: [String : Any]) {
        queryItems = []
        for (key, value) in parameters {
            let query = URLQueryItem(name: key, value: String(describing: value))
            queryItems?.append(query)
        }
    }
}

public extension UIApplicationDelegate {
    public func configureAdobeSign(clientID: String, secret: String, redirectURL: String, loginHost: String, permissions: String = "user_read+user_write+user_login+agreement_read+agreement_write+agreement_send+widget_read+widget_write+library_read+library_write+workflow_read+workflow_write") {
        Sign.configuration = Configuration(clientID: clientID, secret: secret, redirectURL: redirectURL, loginHost: loginHost, permissions: permissions)
    }
}
