//
//  BasicWebViewController.swift
//  AutolayoutStudy
//
//  Created by jaekyung you on 2020/12/22.
//

import UIKit
import WebKit

class BasicWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.naver.com"
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
        
    }
}
