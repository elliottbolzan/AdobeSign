//
//  Views.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public struct Views {

    /// Returns the URL which shows the view page of given agreement asset. Corresponds to POST /views/agreementAssets.
    ///
    /// This endpoint will return the URL of view agreement page for an agreement asset. The agreement asset refers to any asset through which an agreement can be created for instance library document,widget and agreement itself. If the user wants to generate a URL that will automatically log the user in then user_login scope is required in the given Oauth Access Token.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/views/agreementAssets", parameters: parameters, completion: completion).execute()
    }

    /// Returns the URL for manage page. Corresponds to POST /views/agreementAssetList.
    ///
    /// This endpoint will return the URL for manage page. If an agreement asset id is given then that agreement asset will be shown selected in the resulted manage page url.The agreement asset refers to any asset through which an agreement can be created for instance library document, widget and agreement itself. If the user wants to generate a URL that will automatically log the user in then user_login scope is required in the given Oauth Access Token.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createManagePage(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/views/agreementAssetList", parameters: parameters, completion: completion).execute()
    }

    /// Returns the URL for settings page. Corresponds to POST /views/settings.
    ///
    /// This endpoint will return the URL for Settings Page. The settings page can be of two types - user profile page (for non admin) and account settings page (for admin). If the user wants to generate a URL that will automatically log the user in then user_login scope is required in the given Oauth Access Token.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createSettingsPage(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/views/settings", parameters: parameters, completion: completion).execute()
    }

}
