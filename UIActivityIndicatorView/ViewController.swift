//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by Damir Chalkarov on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIndicatorView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        
        activityIndicatorView.color = .green
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.activityIndicatorView.stopAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.activityIndicatorView.startAnimating()
            }
        }
    }


}

