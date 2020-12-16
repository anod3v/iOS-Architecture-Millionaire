//
//  GameViewController.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let buttonA: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: "A", answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonB: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: "B", answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonC: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: "C", answerIsCorrect: false)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonD: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: "D", answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var questionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.numberOfLines = 0
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        addSubviews()
        setupConstraints()
        
    }
    
    func addSubviews() {
        self.view.addSubview(questionLabel)
        self.view.addSubview(buttonA)
        self.view.addSubview(buttonB)
        self.view.addSubview(buttonC)
        self.view.addSubview(buttonD)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 3),
        questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        questionLabel.heightAnchor.constraint(equalToConstant: 200),
        
        buttonA.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 26),
        buttonA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonA.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: (-view.frame.width / 2) - 20),
        buttonA.heightAnchor.constraint(equalToConstant: 20),
        
        buttonB.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 26),
        buttonB.leadingAnchor.constraint(equalTo: buttonA.trailingAnchor, constant: 20),
        buttonB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        buttonB.heightAnchor.constraint(equalToConstant: 20),
        
        buttonC.topAnchor.constraint(equalTo: buttonB.bottomAnchor, constant: 26),
        buttonC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        buttonC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: (-view.frame.width / 2) - 20),
        buttonC.heightAnchor.constraint(equalToConstant: 20),
        
        buttonD.topAnchor.constraint(equalTo: buttonB.bottomAnchor, constant: 26),
        buttonD.leadingAnchor.constraint(equalTo: buttonC.trailingAnchor, constant: 20),
        buttonD.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        buttonD.heightAnchor.constraint(equalToConstant: 20),
        
        
        ])
    }
    
    
    
    
    
}


