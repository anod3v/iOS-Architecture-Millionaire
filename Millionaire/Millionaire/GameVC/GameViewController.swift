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
    
    var currentQuestionIndex = Observable<Int>(0)
    
//    var currentQuestionIndexObservable = Observable<Int>(0)
    
    var delegate: GameSessionDelegate?
    
//    var orderOrRandomSetting = OrderedOrRandomSetting.random
    
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
    
    var countLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .red
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var getQuestionsStrategy: GetQuestionsStrategy {
        switch Game.shared.orderedOrRandomSetting {
        case .random:
            return GetQuestionsRandomly()
        case .ordered:
            return GetQuestionsOrdered()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        addSubviews()
        setupConstraints()
        addTapObservers()
        listOfQuestions = getQuestionsStrategy.getQuestions()
        configureQuestions()
        addCountObserver()
    }
    
    func addCountObserver() {
        currentQuestionIndex.addObserver(self, options: [.new, .initial], closure: { [weak self] (counter, _) in
            guard let self = self else { return }
            self.countLabel.text = "Вопрос: \(counter) из \(self.listOfQuestions.count)"
        })
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
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureQuestions() {
        
//        debugPrint("currentQuestionIndex:", currentQuestionIndex)
        guard currentQuestionIndex.value <= listOfQuestions.count - 1 else { return }
        guard listOfQuestions[currentQuestionIndex.value].answers.count >= 4 else { return }
        
        self.questionLabel.text = listOfQuestions[currentQuestionIndex.value].question
        self.buttonA.label.text = listOfQuestions[currentQuestionIndex.value].answers[0].text
        self.buttonA.answerIsCorrect = listOfQuestions[currentQuestionIndex.value].answers[0].isCorrect
        self.buttonB.label.text = listOfQuestions[currentQuestionIndex.value].answers[1].text
        self.buttonB.answerIsCorrect = listOfQuestions[currentQuestionIndex.value].answers[1].isCorrect
        self.buttonC.label.text = listOfQuestions[currentQuestionIndex.value].answers[2].text
        self.buttonC.answerIsCorrect = listOfQuestions[currentQuestionIndex.value].answers[2].isCorrect
        self.buttonD.label.text = listOfQuestions[currentQuestionIndex.value].answers[3].text
        self.buttonD.answerIsCorrect = listOfQuestions[currentQuestionIndex.value].answers[3].isCorrect
        delegate?.addRecord(index: currentQuestionIndex.value, count: listOfQuestions.count)
        currentQuestionIndex.value += 1
    }
    
    func addSubviews() {
        self.view.addSubview(questionLabel)
        self.view.addSubview(buttonA)
        self.view.addSubview(buttonB)
        self.view.addSubview(buttonC)
        self.view.addSubview(buttonD)
        self.view.addSubview(countLabel)
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
            
            countLabel.topAnchor.constraint(equalTo: buttonD.bottomAnchor, constant: 26),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            countLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}

protocol GameSessionDelegate: AnyObject {
    func addRecord(index: Int, count: Int)
}


