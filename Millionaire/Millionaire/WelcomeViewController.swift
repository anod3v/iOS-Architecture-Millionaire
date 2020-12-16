//
//  WelcomeViewController.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 50, y: 70, width: 200, height: 30)
        textField.backgroundColor = .blue
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Играть", for: .normal)
        button.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resultsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Результаты", for: .normal)
        button.addTarget(self, action: #selector(resultsButtonAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        self.view.addSubview(playButton)
        self.view.addSubview(resultsButton)
        self.view.addSubview(textField)
    }
    
    @objc func playButtonAction(sender: UIButton!) {
        print("playButtonAction tapped")
    }
    
    @objc func resultsButtonAction(sender: UIButton!) {
        print("resultsButtonAction tapped")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 3),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 48),
            
            resultsButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 26),
            resultsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultsButton.heightAnchor.constraint(equalToConstant: 20),
            
            playButton.topAnchor.constraint(equalTo: resultsButton.bottomAnchor, constant: 26),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playButton.heightAnchor.constraint(equalToConstant: 20),
            
            
            
        ])
    }
    
}
