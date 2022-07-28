//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by Damir Chalkarov on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    let topLabel = UILabel()
    let imageView = UIImageView()
    let button = UIButton()
    let progressView = UIProgressView(progressViewStyle: .bar)
    let progress = Progress(totalUnitCount: 11)
    var timer: Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Что привело тебя?"
        topLabel.textAlignment = .center
        topLabel.font = UIFont.systemFont(ofSize: 20)
        topLabel.numberOfLines = 0
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .red
        progressView.observedProgress = progress
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Чем мне заняться сегодня?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2)
        button.addTarget(self, action: #selector(buttonAction(sender: )), for: .touchUpInside)
        
        progress.cancellationHandler = {
            DispatchQueue.main.async {
                self.updateWithAnimation {
                    self.topLabel.alpha = 0
                    self.imageView.alpha = 0
                } completion: {
                    self.topLabel.alpha = 1
                    self.imageView.alpha = 1
                    self.topLabel.text = Source.getTask()
                    self.imageView.image = UIImage(named: "1")
                }

            }
        }
        
        NSLayoutConstraint.activate([
        
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            progressView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func buttonAction(sender: UIButton) {
        DispatchQueue.main.async {
            self.updateWithAnimation {
                self.topLabel.alpha = 0
                self.imageView.alpha = 0
            } completion: {
                self.topLabel.alpha = 1
                self.imageView.alpha = 1
                self.topLabel.text = "Думаю..."
                self.imageView.image = UIImage(named: "2")
            }
           
        }
        var count: Int64 = 0
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { timer in
                if self.progress.fractionCompleted == 1 {
                    self.progress.cancel()
                    timer.invalidate()
                }
                
                self.progress.completedUnitCount = count
                count += 1
            })

        }
    
    func updateWithAnimation(task: @escaping () -> Void, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.25, animations: task) { _ in
            UIView.animate(withDuration: 0.25, animations: completion)
        }
    }


}

