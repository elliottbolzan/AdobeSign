//
//  MegaSigns.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct MegaSigns {

    /// Send an agreement out for signature to multiple recipients. Each recipient will receive and sign their own copy of the agreement. Corresponds to POST /megaSigns.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createAgreement(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/megaSigns", parameters: parameters, completion: completion).execute()
    }

    /// Get all the MegaSign parent agreements of a user. Corresponds to GET /megaSigns.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/megaSigns", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Get detailed information of the specified MegaSign parent agreement. Corresponds to GET /megaSigns/{megaSignId}.
    ///
    /// - Parameters:
    ///   - megaSignId: the identifier of the MegaSign parent agreement, as returned by the megaSign creation API or retrieved from the API to fetch megaSign agreements.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func details(megaSignId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/megaSigns/\(megaSignId)", completion: completion).execute()
    }

    /// Get all the child agreements of the specified MegaSign parent agreement. Corresponds to GET /megaSigns/{megaSignId}/agreements.
    ///
    /// - Parameters:
    ///   - megaSignId: the identifier of the MegaSign parent agreement, as returned by the megaSign creation API or retrieved from the API to fetch megaSign agreements.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func agreements(megaSignId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/megaSigns/\(megaSignId)/agreements", completion: completion).execute()
    }

    /// Retrieves data entered by recipients into interactive form fields at the time they signed the child agreements of the specified MegaSign agreement. Corresponds to GET /megaSigns/{megaSignId}/formData.
    ///
    /// - Parameters:
    ///   - megaSignId: the identifier of the MegaSign parent agreement, as returned by the megaSign creation API or retrieved from the API to fetch megaSign agreements.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func formData(megaSignId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/megaSigns/\(megaSignId)/formData", completion: completion).execute()
    }

    /// Cancel all the child agreements of the specified MegaSign agreement. Corresponds to PUT /megaSigns/{megaSignId}/status.
    ///
    /// - Parameters:
    ///   - megaSignId: the identifier of the MegaSign parent agreement, as returned by the megaSign creation API or retrieved from the API to fetch megaSign agreements.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func updateStatus(megaSignId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/megaSigns/\(megaSignId)/status", parameters: parameters, completion: completion).execute()
    }

}
