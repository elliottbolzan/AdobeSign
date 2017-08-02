//
//  ResponseStrategy.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/7/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ResponseStrategy {
    func complete(completion: Any?, response: DataResponse<Data>?, error: AdobeSignError?)
}

enum ResponseType {

    case JSON
    case Data

    func error(response: DataResponse<Data>) -> String {
        let standard = "There was an error for the request."
        switch self {
        case .JSON:
            if let data = response.data {
                let json = SwiftyJSON.JSON(data: data)
                return "Code: \(json["code"].string ?? "Unavailable"). Message: \(json["message"].string ?? "Unavailable")."
            }
            return standard
        case .Data:
            return standard
        }
    }

    func strategy() -> ResponseStrategy {
        switch self {
        case .JSON:
            return JSONResponseStrategy()
        case .Data:
            return DataResponseStrategy()
        }
    }
    
}
