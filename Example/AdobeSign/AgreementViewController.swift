//
//  AgreementViewController.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/8/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Eureka
import AdobeSign
import WebKit
import SwiftyJSON
import MRProgress

class AgreementViewController: FormViewController {

    let callback = "<YOURS>"
    var agreementId = ""
    var progressView = MRProgressOverlayView()
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Agreement"
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign", style: .done, target: self, action: #selector(sign))
        formatter.locale = .current
        formatter.dateFormat = "MM/dd/YYYY"
        createForm()
    }

    func createForm() {
        form +++ Section("Pizza at Camp")
            <<< TextRow("Camper Name") {
                $0.title = $0.tag
            }
            <<< TextRow("Number of 🍕") {
                $0.title = $0.tag
            }
            <<< DateRow("Start Date") {
                $0.title = $0.tag
            }
        form +++ Section("Contract")
            <<< ButtonRow() {
                $0.title = "Check Status"
            }.onCellSelection( { cell, row in
                self.check()
            })
            <<< ButtonRow() {
                $0.title = "Agreement PDF"
                }.onCellSelection( { cell, row in
                    self.getPDF(agreementId: self.agreementId)
                })
        form +++ Section("Credentials")
            <<< ButtonRow() {
                $0.title = "Logout"
            }.onCellSelection( { cell, row in
                self.logout()
            })
    }

    func sign() {
        showProgress()
        do {
            let data = try Data(contentsOf: Bundle.main.url(forResource: "pizza", withExtension: "pdf")!)
            Sign.transientDocuments.create(data: data, fileName: "pizza.pdf", mimeType: "application/pdf", completion: { result, error in
                guard let result = result, let transientDocumentId = result["transientDocumentId"] as? String else {
                    print(error as Any)
                    return
                }
                self.createAgreement(transientDocumentId: transientDocumentId)
            })
        }
        catch {}
    }

    func createAgreement(transientDocumentId: String) {
        let parameters = getParameters(transientDocumentId: transientDocumentId)
        Sign.agreements.create(parameters: parameters, completion: { result, error in
            guard let result = result, let agreementId = result["agreementId"] as? String else {
                print(error as Any)
                return
            }
            self.agreementId = agreementId
            // Delay introduced to prevent race condition on Adobe's side of things.
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.getSigningURL(agreementId: agreementId)
            }
        })
    }

    func getSigningURL(agreementId: String) {
        Sign.agreements.signingURLs(agreementId: agreementId, completion: { result, error in
            guard let result = result else {
                print(error as Any)
                return
            }
            self.hideProgress()
            let url = JSON(object: result)["signingUrlSetInfos"][0]["signingUrls"][0]["esignUrl"].string
            let browser = Browser(url: URL(string: url ?? "")!, title: "Sign", pageChanged: { url, sender in
                if url.absoluteString.hasPrefix(self.callback) {
                    sender.hide()
                }
            })
            self.present(browser, animated: true, completion: nil)
        })
    }

    func check() {
        if agreementId == "" {
            agreementError()
            return
        }
        showProgress()
        Sign.agreements.status(agreementId: agreementId, completion: { result, error in
            guard let result = result else {
                print(error as Any)
                return
            }
            self.hideProgress()
            let status = JSON(object: result)["participantSetInfos"][0]["status"].string
            self.hideProgress()
            let alert = UIAlertController(title: "Status", message: "The agreement is \(status!.lowercased().replacingOccurrences(of: "_", with: " ")).", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        })
    }

    func logout() {
        Sign.logout(completion: { error in
            guard error == nil else {
                return
            }
            self.navigationController?.popViewController(animated: true)
        })
    }

    func getParameters(transientDocumentId: String) -> [String: Any] {
        let name = (form.rowBy(tag: "Camper Name") as! TextRow).value
        let slices = (form.rowBy(tag: "Number of 🍕") as! TextRow).value
        let start = formatter.string(from: (form.rowBy(tag: "Start Date") as! DateRow).value ?? Date())
        return [
            "documentCreationInfo": [
                "name": "Pizza",
                "postSignOptions": [
                    "redirectUrl": callback,
                    "redirectDelay": 0
                ],
                "fileInfos": [
                    "transientDocumentId": transientDocumentId,
                ],
                "recipientSetInfos": [
                    "recipientSetMemberInfos": [
                        "email": "john.doe@gmail.com"
                    ],
                    "recipientSetName": name ?? "",
                    "recipientSetRole": "SIGNER"
                ],
                "signatureType": "ESIGN",
                "signatureFlow": "SENDER_SIGNATURE_NOT_REQUIRED",
                "formFields": [[
                    "locations": [[
                        "height": 30,
                        "left": 260,
                        "pageNumber": "1",
                        "top": 635,
                        "width": 140
                    ]],
                    "name": "campername",
                    "defaultValue": name ?? "",
                    "fontSize": "20",
                    "readOnly": true
                    ],
                   [
                    "locations": [[
                        "height": 30,
                        "left": 280,
                        "pageNumber": "1",
                        "top": 575,
                        "width": 100
                        ]],
                    "name": "slices",
                    "defaultValue": slices ?? "",
                    "fontSize": "20",
                    "readOnly": true
                    ],
                   [
                    "locations": [[
                        "height": 30,
                        "left": 200,
                        "pageNumber": "1",
                        "top": 515,
                        "width": 100
                        ]],
                    "name": "start",
                    "defaultValue": start,
                    "fontSize": "20",
                    "readOnly": true
                    ]
                ]
            ]
        ]
    }

    func getPDF(agreementId: String) {
        if agreementId == "" {
            agreementError()
            return
        }
        showProgress()
        Sign.agreements.combinedDocument(agreementId: agreementId, parameters: ["auditReport": "true"], completion: { data, error in
            self.hideProgress()
            guard error == nil else {
                print("There was an error.")
                return
            }
            let browser = Browser(data: data!, title: "Agreement PDF", pageChanged: nil)
            browser.show()
        })
    }

    func agreementError() {
        let alert = UIAlertController(title: "No Agreement", message: "Create an agreement before checking on its status.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

    func showProgress() {
        progressView = MRProgressOverlayView()
        self.view.window?.addSubview(progressView)
        progressView.show(true)
    }

    func hideProgress() {
        progressView.dismiss(true)
        progressView.removeFromSuperview()
    }

}
