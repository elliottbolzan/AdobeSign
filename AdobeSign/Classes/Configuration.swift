//
//  Configuration.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/30/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation

public struct Configuration {

    let clientID: String
    let secret: String
    let loginHost: String
    let permissions: String
    public let redirectURL: String

    init() {
        self.init(clientID: "", secret: "", redirectURL: "", loginHost: "", permissions: "")
    }

    init(clientID: String, secret: String, redirectURL: String, loginHost: String, permissions: String) {
        self.clientID = clientID
        self.secret = secret
        self.redirectURL = redirectURL
        self.loginHost = loginHost
        self.permissions = permissions
    }

    func notSet() -> Bool {
        return clientID == "" || secret == "" || redirectURL == "" || loginHost == ""
    }

}
