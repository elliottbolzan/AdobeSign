//
//  Agreements.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct Agreements {

    /// Creates an agreement. Sends it out for signatures, and returns the agreementID in the response to the client. Corresponds to POST /agreements.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/agreements", parameters: parameters, completion: completion).execute()
    }

    /// Creates a new alternative participant. Corresponds to POST /agreements/{agreementId}/participantSets/{participantSetId}/participants/{participantId}/alternateParticipants.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - participantSetId: the participant set identifier.
    ///   - participantId: the participant identifier.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createAlternativeParticipant(agreementId: String, participantSetId: String, participantId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/agreements/\(agreementId)/participantSets/\(participantSetId)/participants/\(participantId)/alternateParticipants", completion: completion).execute()
    }

    /// Retrieves agreements for the user. Corresponds to GET /agreements.
    ///
    /// - Parameters:
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements", completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Returns the current status of an agreement. Corresponds to GET /agreements/{agreementId}.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func status(agreementId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)", completion: completion).execute()
    }

    /// Returns the audit trail for an agreement. Corresponds to GET /agreements/{agreementId}/auditTrail.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func auditTrail(agreementId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/auditTrail", completion: completion).execute()
    }

    /// Retrieves the URL for the e-sign page for the current signer(s) of an agreement. Corresponds to GET /agreements/{agreementId}/signingUrls.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func signingURLs(agreementId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/signingUrls", completion: completion).execute()
    }

    /// Retrieves data entered by the user into interactive form fields at the time they signed the agreement. Corresponds to GET /agreements/{agreementId}/formData.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func formData(agreementId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/formData", completion: completion).execute()
    }

    /// Gets a single combined PDF document for the documents associated with an agreement. Corresponds to GET /agreements/{agreementId}/combinedDocument.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func combinedDocument(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/combinedDocument", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves URL of all visible pages of all the documents associated with an agreement. Corresponds to GET /agreements/{agreementId}/combinedDocument/url.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func combinedDocumentURL(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/combinedDocument/url", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves info of all pages of a combined PDF document for the documents associated with an agreement. Corresponds to GET /agreements/{agreementId}/combinedDocument/pagesInfo.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func pagesInfo(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/combinedDocument/pagesInfo", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the IDs of all the main and supporting documents of an agreement identified by agreementId. Corresponds to GET /agreements/{agreementId}/documents.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func documents(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/documents", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves image urls of all visible pages of all the documents associated with an agreement. Corresponds to GET /agreements/{agreementId}/documents/imageUrls.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func allImageURLs(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/documents/imageUrls", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the file stream of a document of an agreement. Corresponds to GET /agreements/{agreementId}/documents/{documentId}.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified agreement.
    ///   - result: an optional Data response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func document(agreementId: String, documentId: String, completion: @escaping (_ result: Data?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/documents/{documentId}", completion: completion).execute()
    }

    /// Retrieves the URL of the document. Corresponds to GET /agreements/{agreementId}/documents/{documentId}/url.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func documentURL(agreementId: String, documentId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/documents/\(documentId)/url", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Retrieves the URL of the document. Corresponds to GET /agreements/{agreementId}/documents/{documentId}/imageUrls.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - documentId: the document identifier, as retrieved from the API which fetches the documents of a specified agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func imageURLsFor(agreementId: String, documentId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/agreements/\(agreementId)/documents/\(documentId)/imageUrls", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

    /// Updates an existing agreement that is already out for signature. Corresponds to PUT /agreements/{agreementId}.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func update(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/agreements/\(agreementId)", parameters: parameters, completion: completion).execute()
    }

    /// Cancels an agreement. Corresponds to PUT /agreements/{agreementId}/status.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func updateStatus(agreementId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .put, path: "/agreements/\(agreementId)/status", parameters: parameters, completion: completion).execute()
    }

    /// Deletes an agreement. Agreement will no longer be visible in the Manage Page of the user. Corresponds to DELETE /agreements/{agreementId}.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func delete(agreementId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .delete, path: "/agreements/{agreementId}", completion: completion).execute()
    }

    /// Deletes all the documents of an agreement. Agreement will be visible in the Manage Page of the user. Corresponds to DELETE /agreements/{agreementId}/documents.
    ///
    /// - Parameters:
    ///   - agreementId: the identifier corresponding to the agreement.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func deleteDocuments(agreementId: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .delete, path: "/agreements/{agreementId}/documents", completion: completion).execute()
    }

}
