//
//  RequestStrategy.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/7/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

protocol RequestStrategy {
    func execute(router: Router)
}

enum BodyType {

    case Normal
    case MultipartForm

    func strategy() -> RequestStrategy {
        switch self {
        case .Normal:
            return NormalRequestStrategy()
        case .MultipartForm:
            return MultipartFormRequestStrategy()
        }
    }
    
}
