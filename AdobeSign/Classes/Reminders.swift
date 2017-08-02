//
//  Reminders.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public struct Reminders {

    /// Sends a reminder for an agreement. Corresponds to POST /reminders.
    ///
    /// - Parameters:
    ///   - parameters: the parameters for the request.
    ///   - result: an optional JSON response from Adobe Sign.
    ///   - error: an optional AdobeSignError caused by the call to Adobe Sign's servers.

    public func send(parameters: [String: Any], completion: @escaping (_ result: [String : Any]?, _ error: AdobeSignError?) -> Void) {
        Router(method: .post, path: "/reminders", parameters: parameters, completion: completion).execute()
    }

}
