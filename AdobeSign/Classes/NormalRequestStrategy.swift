//
//  Requester.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/7/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

class NormalRequestStrategy: RequestStrategy {

    func execute(router: Router) {
        Alamofire.request(router.url, method: router.method, parameters: router.parameters, encoding: router.encoding, headers: Sign.manager.headers()).validate().responseData(completionHandler: { response in
            router.process(response: response)
        })
    }

}
