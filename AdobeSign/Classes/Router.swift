//
//  Router.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/5/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Router {

    let method: HTTPMethod
    let url: URL
    let parameters: [String: Any]?
    let completion: Any?
    let bodyType: BodyType
    var responseType: ResponseType
    let encoding: ParameterEncoding

    init(method: HTTPMethod = .post, base: String = Sign.manager.accessPoint!, path: String, parameters: [String: Any]? = nil, completion: Any?, bodyType: BodyType = .Normal, encoding: ParameterEncoding = JSONEncoding.default) {
        self.method = method
        self.parameters = parameters
        var components = URLComponents(string: base)!
        components.path = AdobeSign.APIVersion + path
        self.url = components.url!
        self.completion = completion
        self.bodyType = bodyType
        self.responseType = .JSON
        if (completion as? (Data?, AdobeSignError?) -> Void) != nil {
            self.responseType = .Data
        }
        self.encoding = encoding
    }

    func process(response: DataResponse<Data>) {
        switch response.result {
        case .failure(_):
            let error = responseType.error(response: response)
            if let statusCode = response.response?.statusCode {
                if statusCode == 401 {
                    Sign.manager.authenticate(completion: { success, _ in
                        if success {
                            self.execute()
                            return
                        }
                        self.complete(response: response, error: AdobeSignError.responseFailure(message: error))
                    })
                    return
                }
            }
            complete(response: response, error: AdobeSignError.responseFailure(message: error))
        case .success(_):
            complete(response: response, error: nil)
        }
    }

    func complete(response: DataResponse<Data>?, error: AdobeSignError?) {
        responseType.strategy().complete(completion: completion, response: response, error: error)
    }

    func isJSON(response: DataResponse<Data>) -> Bool {
        let headers = JSON(object: response.response?.allHeaderFields ?? [:])
        return ((headers["Content-Type"].string) ?? "").contains("application/json")
    }

    func execute() {
        if Sign.configuration.notSet() {
            complete(response: nil, error: AdobeSignError.configuration())
            return
        }
        self.bodyType.strategy().execute(router: self)
    }

}
