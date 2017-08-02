//
//  BaseUris.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public class BaseUris {

    /// Returns the API and Web access points. Corresponds to GET /base_uris.
    ///
    /// - Parameters:
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func get(completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .get, base: "https://api.na1.echosign.com", path: "/base_uris", completion: completion).execute()
    }
    
}
