//
//  DetailBook.swift
//  iBooks
//
//  Created by Pham Ngoc Hai on 12/26/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class DetailBook: UIViewController {

    @IBOutlet weak var btnShowDate: UIButton!
    @IBOutlet weak var Webview: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    @IBAction func getCurrentTime(_ sender: UIButton) {
        self.Webview.stringByEvaluatingJavaScript(from: "hello();")

    }
  
    
  
    var urlString : String = ""
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString
        //         set webview delegate
        self.Webview.delegate = self
        
        // fit content within screen size.
        self.Webview.scalesPageToFit = true
        
        // start spinner
        self.myActive.startAnimating()
        var urlpath = "default"
        // load url content within webview
        switch(type)
        {
        case "PDF" : urlpath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
        self.btnShowDate.isHidden = true
        case "DOCX" : urlpath = Bundle.main.path(forResource: urlString, ofType: "docx")!
        self.btnShowDate.isHidden = true
        case "HTML" : urlpath = Bundle.main.path(forResource: urlString, ofType: "html")!
        self.btnShowDate.isHidden = false
        default : break
        }
        let url:URL = URL(fileURLWithPath: urlpath)
        //        if let urlToBrowse = NSURL.fileURLWithPath(urlpath!) {
        let urlRequest = URLRequest(url: url)
        self.Webview.loadRequest(urlRequest)
        //        }
    }
}

extension DetailBook : UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.myActive.isHidden = true
        self.myActive.stopAnimating()
    }
    func webViewDidStartLoad(_ webView: UIWebView)
    {
        print("")
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        print("")
        return true
    }
}
