//
//  Groups.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public struct Groups {

    /// Creates a new group in an account. Corresponds to POST /groups.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/groups", parameters: parameters, completion: completion).execute()
    }

    /// Gets all the groups in an account. Corresponds to GET /groups.
    ///
    /// - Parameters:
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/groups", completion: completion).execute()
    }

    /// Retrieve detailed information about the group. Corresponds to GET /groups/{groupId}.
    ///
    /// - Parameters:
    ///   - groupId: the group identifier, as returned by the group creation API or retrieved from the API to fetch groups.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func details(groupId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/groups/\(groupId)", completion: completion).execute()
    }

    /// Gets all the users in a group. Corresponds to GET /groups/{groupId}/users.
    ///
    /// - Parameters:
    ///   - groupId: the group identifier, as returned by the group creation API or retrieved from the API to fetch groups.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func users(groupId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/groups/\(groupId)/users", completion: completion).execute()
    }

    /// Update an existing group. Corresponds to PUT /groups/{groupId}.
    ///
    /// - Parameters:
    ///   - groupId: the group identifier, as returned by the group creation API or retrieved from the API to fetch groups.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func update(groupId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/groups/\(groupId)", parameters: parameters, completion: completion).execute()
    }

    /// Delete an existing group. Corresponds to DELETE /groups/{groupId}.
    ///
    /// - Parameters:
    ///   - groupId: the group identifier, as returned by the group creation API or retrieved from the API to fetch groups.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func delete(groupId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .delete, path: "/groups/\(groupId)", completion: completion).execute()
    }

}
