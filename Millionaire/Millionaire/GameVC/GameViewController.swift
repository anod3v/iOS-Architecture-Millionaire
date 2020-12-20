//
//  GameViewController.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var listOfQuestions = [QuestionAndAnswers]()
    
    var currentQuestionIndex = 0
    
    var delegate: GameSessionDelegate?
    
    var orderOrRandomSetting = OrderedOrRandomSetting.random
    
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        addSubviews()
        setupConstraints()
        addTapObservers()
        configureQuestions()
    }
    
    func addTapObservers() {
        self.buttonA.didTapAnswer = { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response: response)
        }
        self.buttonB.didTapAnswer = { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response: response)
        }
        self.buttonC.didTapAnswer = { [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response: response)
        }
        self.buttonD.didTapAnswer = {  [weak self] response in
            guard let self = self else { return }
            self.handleResponse(response: response)
        }
    }
    
    func handleResponse(response: Int) {
        if response == 1 {
            self.configureQuestions()
        } else {
            let welcomeViewController = WelcomeViewController()
            welcomeViewController.modalPresentationStyle = .fullScreen
            show(welcomeViewController, sender: nil)
        }
    }
    
    convenience init() {
        self.init(listOfQuestions: [QuestionAndAnswers]())
    }
    
    init(listOfQuestions: [QuestionAndAnswers]) {
        self.listOfQuestions = listOfQuestions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureQuestions() {
        debugPrint("currentQuestionIndex:", currentQuestionIndex)
        guard currentQuestionIndex <= listOfQuestions.count - 1 else { return }
        guard listOfQuestions[currentQuestionIndex].answers.count >= 4 else { return }
        
        self.questionLabel.text = listOfQuestions[currentQuestionIndex].question
        self.buttonA.label.text = listOfQuestions[currentQuestionIndex].answers[0].text
        self.buttonA.answerIsCorrect = listOfQuestions[currentQuestionIndex].answers[0].isCorrect
        self.buttonB.label.text = listOfQuestions[currentQuestionIndex].answers[1].text
        self.buttonB.answerIsCorrect = listOfQuestions[currentQuestionIndex].answers[1].isCorrect
        self.buttonC.label.text = listOfQuestions[currentQuestionIndex].answers[2].text
        self.buttonC.answerIsCorrect = listOfQuestions[currentQuestionIndex].answers[2].isCorrect
        self.buttonD.label.text = listOfQuestions[currentQuestionIndex].answers[3].text
        self.buttonD.answerIsCorrect = listOfQuestions[currentQuestionIndex].answers[3].isCorrect
        delegate?.addRecord(index: currentQuestionIndex, count: listOfQuestions.count)
        currentQuestionIndex += 1
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
            buttonA.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            buttonA.heightAnchor.constraint(equalToConstant: 20),
            
            buttonB.topAnchor.constraint(equalTo: buttonA.bottomAnchor, constant: 26),
            buttonB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonB.heightAnchor.constraint(equalToConstant: 20),
            
            buttonC.topAnchor.constraint(equalTo: buttonB.bottomAnchor, constant: 26),
            buttonC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonC.heightAnchor.constraint(equalToConstant: 20),
            
            buttonD.topAnchor.constraint(equalTo: buttonC.bottomAnchor, constant: 26),
            buttonD.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonD.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonD.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}

protocol GameSessionDelegate: AnyObject {
    func addRecord(index: Int, count: Int)
}


