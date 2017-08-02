//
//  Users.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct Users {

    /// Creates a new user in the Adobe Sign system. Corresponds to POST /users.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/users", parameters: parameters, completion: completion).execute()
    }

    /// Gets all the users in an account. Corresponds to GET /users.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/users", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieve detailed information about the user in the caller account. Corresponds to GET /users/{userId}.
    ///
    /// - Parameters:
    ///   - userId: the user identifier, as returned by the user creation API or retrieved from the API to fetch users. To get the details for the token owner, UserId can be replaced by "me" without quotes.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func user(userId: String = "", completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/users/\(userId)", completion: completion).execute()
    }

    /// Gets all the users in an account. Corresponds to PUT /users/{userId}.
    ///
    /// - Parameters:
    ///   - userId: the user identifier, as provided by GET /users or POST /users.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func updateUser(userId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/users/\(userId)", parameters: parameters, completion: completion).execute()
    }

    /// Activate/Deactivate a given user. Corresponds to PUT /users/{userId}/status.
    ///
    /// - Parameters:
    ///   - userId: the user identifier, as provided by GET /users or POST /users.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func updateUserStatus(userId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/users/\(userId)/status", parameters: parameters, completion: completion).execute()
    }

}
