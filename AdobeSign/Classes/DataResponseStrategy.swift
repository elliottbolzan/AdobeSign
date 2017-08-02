//
//  DataResponseStrategy.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/7/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataResponseStrategy: ResponseStrategy {

    func complete(completion: Any?, response: DataResponse<Data>?, error: AdobeSignError?) {
        let completion = (completion as? (Data?, AdobeSignError?) -> Void)
        if error != nil {
            completion?(nil, error)
            return
        }
        completion?(response?.data, error)
    }

}
