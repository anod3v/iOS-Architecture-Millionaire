//
//  WelcomeViewController.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var listOfQuestions: [QuestionAndAnswers] = {
        let array = ModelFactory.getQuestionsAndAnswers()
        return array
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Играть", for: .normal)
        button.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resultsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
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
//        self.view.addSubview(textField)
    }
    
    @objc func playButtonAction(sender: UIButton!) {
        let gameViewController = GameViewController(listOfQuestions: self.listOfQuestions)
        gameViewController.modalPresentationStyle = .fullScreen
        gameViewController.delegate = GameSession()
        self.show(gameViewController, sender: nil)
    }
    
    @objc func resultsButtonAction(sender: UIButton!) {
        let resultsViewController = ResultsViewController()
//        resultsViewController.modalPresentationStyle = .fullScreen
        self.show(resultsViewController, sender: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            resultsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 3),
            resultsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultsButton.heightAnchor.constraint(equalToConstant: 40),
            
            playButton.topAnchor.constraint(equalTo: resultsButton.bottomAnchor, constant: 26),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
}
