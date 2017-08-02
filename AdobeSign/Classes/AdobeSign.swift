//
//  AdobeSign.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 6/29/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import Alamofire

public let Sign = AdobeSign.shared

public class AdobeSign {

    open static let APIVersion = "/api/rest/v5"
    
    open static let shared = AdobeSign()
    open let manager = Manager()
    open var configuration = Configuration()

    fileprivate init() {}

    public let agreements = Agreements()
    public let baseUris = BaseUris()
    public let groups = Groups()
    public let libraryDocuments = LibraryDocuments()
    public let megaSigns = MegaSigns()
    public let reminders = Reminders()
    public let search = Search()
    public let transientDocuments = TransientDocuments()
    public let users = Users()
    public let views = Views()
    public let widgets = Widgets()
    public let workflows = Workflows()

    public func login(completion: ((Bool, AdobeSignError?) -> Void)?) {
        manager.authenticate(completion: completion)
    }

    public func logout(completion: ((AdobeSignError?) -> Void)?) {
        manager.logout(completion: completion)
    }

}
