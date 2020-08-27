//
//  RegisterViewController.swift
//  onlineAnytime
//
//  Created by Admin on 26/08/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: Common.Register_url)
        webView.load(URLRequest(url: url!))
        SVProgressHUD.show()
       
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
}

extension RegisterViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        let url = URL(string: Common.Register_url)
        webView.load(URLRequest(url: url!))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
           SVProgressHUD.dismiss()
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading")
        webView.scrollView.setContentOffset(CGPoint.zero, animated: true)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
    }
    
    // WKNavigationDelegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let newURL = navigationAction.request.url,
                let host = newURL.host , !host.hasPrefix("www.google.com"){
                webView.load(URLRequest(url: newURL))
            }
        }
        decisionHandler(.allow)
    }
}
