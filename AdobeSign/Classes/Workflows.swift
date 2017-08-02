//
//  Workflows.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct Workflows  {

    /// Creates an agreement. Sends it out for signatures, and returns the agreementID in the response to the client. Corresponds to POST /workflows/{workflowId}/agreements.
    ///
    /// - Parameters:
    ///   - workflowId: the workflow identifier, as retrieved from the API to fetch workflows.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createAgreement(workflowId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/workflows/\(workflowId)/agreements", parameters: parameters, completion: completion).execute()
    }

    /// Retrieves workflows for the user. Corresponds to GET /workflows.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/workflows", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the details of a workflow. Corresponds to GET /workflows/{workflowId}.
    ///
    /// - Parameters:
    ///   - workflowId: the workflow identifier, as retrieved from the API to fetch workflows.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func details(workflowId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/workflows/\(workflowId)", completion: completion).execute()
    }

}
