//
//  Browser.swift
//  AdobeSign
//
//  Created by Elliott Bolzan on 7/5/17.
//  Copyright © 2017 Elliott Bolzan. All rights reserved.
//

import Foundation
import SafariServices
import Alamofire
import WebKit

public final class Browser: UINavigationController {

    var content: Content?

    class Content: UIViewController, WKNavigationDelegate, WKUIDelegate {

        let owner: Browser?
        var url: URL?
        var data: Data?
        public var pageChanged: ((URL, Browser) -> Void)?

        var webView: WKWebView!
        let progressBar = UIProgressView(progressViewStyle: .bar)

        public convenience init(owner: Browser, url: URL, title: String, pageChanged: ((URL, Browser) -> Void)?) {
            self.init(owner: owner, title: title, pageChanged: pageChanged)
            self.url = url
        }

        public convenience init(owner: Browser, data: Data, title: String, pageChanged: ((URL, Browser) -> Void)?) {
            self.init(owner: owner, title: title, pageChanged: pageChanged)
            self.data = data
        }

        init(owner: Browser, title: String, pageChanged: ((URL, Browser) -> Void)?) {
            self.owner = owner
            self.pageChanged = pageChanged
            super.init(nibName: nil, bundle: nil)
            self.navigationItem.title = title
        }

        required public init?(coder aDecoder: NSCoder) {
            pageChanged = nil
            url = nil
            owner = nil
            super.init(coder: aDecoder)
        }

        override public func loadView() {
            super.loadView()
            self.view.backgroundColor = .white
            setupProgressBar()
            setupWebView()
        }

        override public func viewDidLoad() {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(hide))
            if let url = url {
                webView.load(URLRequest(url: url))
            }
            else if let data = data {
                webView.load(data, mimeType: "application/pdf", characterEncodingName: "UTF8", baseURL: URL(string: "/")!)
            }
        }

        func setupWebView() {
            let webViewConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.uiDelegate = self
            webView.navigationDelegate = self
            webView.allowsBackForwardNavigationGestures = false
            webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
            view.addSubview(webView)
            webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            webView.topAnchor.constraint(equalTo: progressBar.bottomAnchor).isActive = true
            webView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        func setupProgressBar() {
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(progressBar)
            progressBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            progressBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            progressBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            progressBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
        }

        override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if (keyPath == "estimatedProgress") {
                progressBar.isHidden = webView.estimatedProgress == 1
                progressBar.setProgress(Float(webView.estimatedProgress), animated: true)
            }
        }

        public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            progressBar.setProgress(0.0, animated: false)
        }

        public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (@escaping (WKNavigationActionPolicy) -> Void)) {
            decisionHandler(.allow)
            guard let url = navigationAction.request.url else {
                return
            }
            pageChanged?(url, owner!)
        }

        func hide() {
            owner!.hide()
        }

        deinit {
            webView.navigationDelegate = nil
            webView.removeObserver(self, forKeyPath: "estimatedProgress")
        }

    }

    public init(url: URL, title: String, pageChanged: ((URL, Browser) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        content = Content(owner: self, url: url, title: title, pageChanged: pageChanged)
        self.viewControllers = [content!]
    }

    public init(data: Data, title: String, pageChanged: ((URL, Browser) -> Void)?) {
        super.init(nibName: nil, bundle: nil)
        content = Content(owner: self, data: data, title: title, pageChanged: pageChanged)
        self.viewControllers = [content!]
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func show() {
        topViewController()?.present(self, animated: true, completion: nil)
    }

    public func hide() {
        content?.pageChanged = nil
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }

    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
}
