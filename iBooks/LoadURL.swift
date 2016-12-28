//
//  LoadURL.swift
//  iBooks
//
//  Created by Pham Ngoc Hai on 12/26/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class LoadURL: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var urlString: UITextField!
    
    let baseUrl = "http://www."
    
    override func viewDidLoad() {
        myActivity.isHidden = true
        super.viewDidLoad()
    }
}

extension LoadURL : UITextFieldDelegate, UIWebViewDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        myActivity.isHidden = false
        let url = URL(string: baseUrl + textField.text!)!
        let urlRequest = URLRequest(url: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        myActivity.isHidden = true
        myActivity.stopAnimating()
    }
}
  
