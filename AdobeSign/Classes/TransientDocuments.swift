//
//  TransientDocuments.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public struct TransientDocuments {

    /// Creates a transient document. Corresponds to POST /transientDocuments.
    ///
    /// - Parameters:
    ///   - data: the file to be uploaded.
    ///   - fileName: the file's name.
    ///   - mimeType: the file's MIME type.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func create(data: Data, fileName: String, mimeType: String, completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        let parameters: [String : Any] = [
            "File-Name" : fileName,
            "Mime-Type" : mimeType,
            "File" : data
        ]
        Router(path: "/transientDocuments", parameters: parameters, completion: completion, bodyType: .MultipartForm).execute()
    }

}
