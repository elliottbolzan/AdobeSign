//
//  LibraryDocuments.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct LibraryDocuments {

    /// Creates a template that is placed in the library of the user for reuse. Corresponds to POST /libraryDocuments.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/libraryDocuments", parameters: parameters, completion: completion).execute()
    }

    /// Retrieves library documents for a user. Corresponds to GET /libraryDocuments.
    ///
    /// - Parameters:
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments", completion: completion).execute()
    }

    /// Retrieves the details of a library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func details(libraryDocumentId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)", completion: completion).execute()
    }

    /// Retrieves the audit trail associated with a library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}/auditTrail.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func auditTrail(libraryDocumentId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)/auditTrail", completion: completion).execute()
    }

    /// Retrieves the combined document associated with a library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}/combinedDocument.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func combinedDocument(libraryDocumentId: String, parameters: [String: Any], completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)/combinedDocument", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the ID of the document associated with library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}/documents.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func documents(libraryDocumentId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)/documents", completion: completion).execute()
    }

    /// Retrieves the file stream of a library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}/documents/{documentId}.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified library document.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func document(libraryDocumentId: String, documentId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)/documents/\(documentId)", completion: completion).execute()
    }

    /// Retrieves image URLs of all visible pages of a document associated with an library document. Corresponds to GET /libraryDocuments/{libraryDocumentId}/documents/{documentId}/imageUrls.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified library document.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func imageURLs(for libraryDocumentId: String, documentId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/libraryDocuments/\(libraryDocumentId)/documents/\(documentId)/imageUrls", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Deletes a library document. Library document will no longer be visible in the Manage Page of the user. Corresponds to DELETE /libraryDocuments/{libraryDocumentId}.
    ///
    /// - Parameters:
    ///   - libraryDocumentId: the document identifier, as retrieved from the API to fetch library documents.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func delete(libraryDocumentId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .delete, path: "/libraryDocuments/\(libraryDocumentId)", completion: completion).execute()
    }

}
