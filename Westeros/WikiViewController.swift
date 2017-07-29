//
//  WikiViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/28/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var browserView: UIWebView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let model : House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        browserView.delegate = self
        syncViewWithModel()
    }
    
    func syncViewWithModel() {
        
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        title = model.name
        browserView.loadRequest(URLRequest(url: model.wikiUrl))
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked || navigationType == .formSubmitted) {
            return false
        } else {
            return true
        }
    }
}
