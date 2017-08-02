//
//  Search.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public struct Search {

    /// Create a search object for agreement asset event. It will return the result for the first page and search Id to fetch results for further pages. Corresponds to POST /search/agreementAssetEvents.
    ///
    /// The agreement asset refers to any asset through which an agreement can be created for instance library document, widget and agreement itself. To search for Agreement Asset Events, first make a request to the API that creates agreementAssetEvents with relevant search parameters. Response will be the first page of results along with a search Id param and next page cursor. These can be used to fetch further page results if they are available using the API which retrieves agreementAssetEvents based on searchId.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func createAgreementAssetEvent(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/search/agreementAssetEvents", parameters: parameters, completion: completion).execute()
    }

    /// Return the result for the page which is described inside the Page Cursor Info. Corresponds to GET /search/agreementAssetEvents/{searchId}.
    ///
    /// The agreement asset refers to any asset through which an agreement can be created for instance library document,widget and agreement itself. Provide the searchId obtained from the API that creates agreementAssetEvents and the next page cursor id from the original call to the API that creates agreementAssetEvents or a previous call to the API that retrieves agreementAssetEvents based on searchId.
    ///
    /// - Parameters:
    ///   - searchId: the search object identifier, as returned by the agreementAssetEvent creation API.
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func getPage(searchId: String, parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, path: "/search/agreementAssetEvents/\(searchId)", parameters: parameters, completion: completion, encoding: URLEncoding.queryString).execute()
    }

}
