import Foundation

//
//  Uploader.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/5/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

class MultipartFormRequestStrategy: RequestStrategy {
    
    func execute(router: Router) {
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in router.parameters ?? [:] {
                    if let value = value as? String {
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
                    else if let value = value as? Data  {
                        multipartFormData.append(value, withName: key)
                    }
                }
        },
        to: router.url,
        headers: Sign.manager.headers(),
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.validate()
                upload.responseData(completionHandler: { response in
                    router.process(response: response)
                })
            case .failure(let encodingError):
                (router.completion as? ([String : Any]?, AdobeSignError?) -> Void)?(nil, AdobeSignError.responseFailure(message: encodingError.localizedDescription))
            }
        })
    }
    
}
