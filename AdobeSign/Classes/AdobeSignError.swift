//
//  AdobeSignError.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/30/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public enum AdobeSignError: Error {
    case error(message: String)
    case configuration()
    case responseFailure(message: String)
    case mangledJSON(response: Any?)
}

extension AdobeSignError: CustomDebugStringConvertible {

    public var debugDescription: String {
        switch self {
        case let .error(message):
            return "Adobe Sign error: \(message)"
        case .configuration:
            return "Please configure AdobeSign from your AppDelegate."
        case let .responseFailure(message):
            return "Adobe Sign response error: \(message)"
        case let .mangledJSON(response):
            return "Adobe Sign couldn't desererialize JSON: \(response ?? "nil")"
        }
    }

}
