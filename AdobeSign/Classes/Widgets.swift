//
//  Widgets.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct Widgets {

    /// Creates a widget and returns the Javascript snippet and URL to access the widget and widgetID in response to the client. Corresponds to POST /widgets.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/widgets", parameters: parameters, completion: completion).execute()
    }

    /// Retrieves widgets for a user. Corresponds to GET /widgets.
    ///
    /// - Parameters:
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets", completion: completion).execute()
    }

    /// Retrieves the details of a widget. Corresponds to GET /widgets/{widgetId}.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func details(widgetId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)", completion: completion).execute()
    }

    /// Retrieves the audit trail of a widget identified by widgetId. Corresponds to GET /widgets/{widgetId}/auditTrail.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func auditTrail(widgetId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/auditTrail", completion: completion).execute()
    }

    /// Gets a single combined PDF document for the documents associated with a widget. Corresponds to GET /widgets/{widgetId}/combinedDocument.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func combinedDocument(widgetId: String, parameters: [String: Any], completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/combinedDocument", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves data entered by the user into interactive form fields at the time they signed the widget. Corresponds to GET /widgets/{widgetId}/formData.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func formData(widgetId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/formData", completion: completion).execute()
    }

    /// Retrieves agreements for the widget. Corresponds to GET /widgets/{widgetId}/agreements.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func agreements(widgetId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/agreements", completion: completion).execute()
    }

    /// Retrieves the IDs of the documents associated with widget. Corresponds to GET /widgets/{widgetId}/documents.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func documents(widgetId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/documents", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the file stream of a document of an agreement. Corresponds to GET /widgets/{widgetId}/documents/{documentId}.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified widget.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func document(widgetId: String, documentId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/widgets/\(widgetId)/documents/\(documentId)", completion: completion).execute()
    }

    /// Personalize the widget to a signable document for a specific known user. Corresponds to PUT /widgets/{widgetId}/personalize.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func personalize(widgetId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/widgets/\(widgetId)/personalize", parameters: parameters, completion: completion).execute()
    }

    /// Enables or Disables a widget. Corresponds to PUT /widgets/{widgetId}/status.
    ///
    /// - Parameters:
    ///   - widgetId: the widget identifier, as returned by the widget creation API or retrieved from the API to fetch widgets.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func updateStatus(widgetId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/widgets/\(widgetId)/status", parameters: parameters, completion: completion).execute()
    }

}
