//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by Damir Chalkarov on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
  let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
    let progress = Progress(totalUnitCount: 11)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(progressView)
        progressView.center = view.center
        progressView.progress = 0.1
        progressView.progressTintColor = .red
        progressView.trackTintColor = .green
        
        progressView.observedProgress = progress
        progress.cancellationHandler = {
            print("progress was stopped")
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var count: Int64 = 0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.progress.isCancelled {
                timer.invalidate()
            }
            
            if self.progress.fractionCompleted == 1 {
                self.progress.cancel()
            }
            
            self.progress.completedUnitCount = count
            count += 1
            print(count)
        }
        
    }


}

