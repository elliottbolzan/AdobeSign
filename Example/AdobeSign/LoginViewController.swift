//
//  LoginViewController.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 07/08/2017.
//  Copyright (c) 2017 Elliott Bolzan. All rights reserved.
//

import UIKit
import AdobeSign

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Adobe Sign"
    }

    @IBAction func login() {
        Sign.login(completion: { success, error in
            guard success else {
                return
            }
            self.performSegue(withIdentifier: "login", sender: self)
        })
    }

}

