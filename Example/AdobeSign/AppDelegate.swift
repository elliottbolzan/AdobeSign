//
//  AppDelegate.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 07/08/2017.
//  Copyright (c) 2017 Elliott Bolzan. All rights reserved.
//

import UIKit
import AdobeSign

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureAdobeSign(clientID: "<YOURS>", secret: "<YOURS>", redirectURL: "<YOURS>", loginHost: "<YOURS>", permissions: "user_login+agreement_read+agreement_write+agreement_send")
        return true
    }

}

