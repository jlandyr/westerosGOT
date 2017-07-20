//
//  WikiViewController.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //_model es con guión bajo porque las variables privadas se crean con esta convención
    //private: _model se puede ver solo dentro de este archivo WikiViewController.swift
    private let _model : House
    
    //es obligatorio inicializar el modelo
    init(model:House) {
        self._model = model
        super.init(nibName: nil, bundle: nil)
    }
    //es obligatorio el init de esta forma, mientras no se desarrolle en swift UIKit (Xcode 9 talvez)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        syncViewWithModel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func syncViewWithModel() {

        
        self.title = _model.name
        self.webView.loadRequest(URLRequest(url: _model.wiki))
    }
    
    func webViewDidStartLoad(_ webView: UIWebView)
    {

        activityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool
    {
        //evita q el usuario navegue en el UIWebView
        if navigationType == .linkClicked || navigationType == .formSubmitted || navigationType == .formResubmitted{
            return false
        }else{
            return true
        }
    }
}
