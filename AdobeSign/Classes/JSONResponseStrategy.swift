//
//  JSONResponseStrategy.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/7/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class JSONResponseStrategy: ResponseStrategy {

    func complete(completion: Any?, response: DataResponse<Data>?, error: AdobeSignError?) {
        let completion = (completion as? ([String : Any]?, AdobeSignError?) -> Void)
        if error != nil {
            completion?(nil, error)
            return
        }
        completion?(JSON(data: response!.data!).dictionaryObject, error)
    }

}
