//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Andrey on 21/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

//
//  LoginFormViewController.swift
//  VKgram
//
//  Created by Andrey on 12/09/2020.
//  Copyright © 2020 Andrey. All rights reserved.
//

import UIKit

class WhichIsCorrect {
    var optionA = false { willSet { resetAll() } }
    var optionB = false { willSet { resetAll() } }
    var optionC = false { willSet { resetAll() } }
    var optionD = false { willSet { resetAll() } }
    
    lazy var allOptions = [optionA, optionB, optionC, optionB]
    
    func resetAll() {
        for index in allOptions.indices {
            allOptions[index] = false
        }
    }
}

class AddQuestionViewController: UIViewController {
    
    var questionAndAnswers: QuestionAndAnswers?
    
    var whichIsCorrect = WhichIsCorrect()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .cyan
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .magenta
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        let labelText  = "Вопрос:"
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        let textWithAttributes = NSMutableAttributedString(string: labelText, attributes:attributes)
        label.attributedText = textWithAttributes
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questionTextField: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Введите здесь вопрос"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let answersLabel: UILabel = {
        let label = UILabel()
        let labelText  = "Варианты ответов:"
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        let textWithAttributes = NSMutableAttributedString(string: labelText, attributes:attributes)
        label.attributedText = textWithAttributes
        label.backgroundColor = .clear
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerTextFieldA: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Вариант А"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let answerTextFieldB: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Вариант B"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let answerTextFieldC: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Вариант C"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let answerTextFieldD: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Вариант D"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let segmentedControl: TTSegmentedControl = {
        let control = TTSegmentedControl()
        control.allowChangeThumbWidth = false
        control.itemTitles = ["A","B", "C", "D"]
        control.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(0.3))
        control.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(0.01))
        control.useGradient = false
        control.thumbColor = TTSegmentedControl.UIColorFromRGB(0x1FDB58)
        control.useShadow = false
        control.cornerRadius = 5
        control.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x56D37C)
        control.selectItemAt(index: 0)
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        let labelText  = "Добавить"
        let attributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        let textWithAttributes = NSMutableAttributedString(string: labelText, attributes:attributes)
        button.backgroundColor = .clear
        button.setAttributedTitle(textWithAttributes, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        // add the scroll view
        self.view.addSubview(scrollView)
        
        // add contentView to scroll view
        scrollView.addSubview(contentView)
        
        // add two labels to contentView
        contentView.addSubview(questionLabel)
        contentView.addSubview(questionTextField)
        contentView.addSubview(answersLabel)
        contentView.addSubview(answerTextFieldA)
        contentView.addSubview(answerTextFieldB)
        contentView.addSubview(answerTextFieldC)
        contentView.addSubview(answerTextFieldD)
        contentView.addSubview(addButton)
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            questionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            questionTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            questionTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            questionTextField.heightAnchor.constraint(equalToConstant: 40),
            questionTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            questionTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            answersLabel.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 20),
            answersLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answersLabel.heightAnchor.constraint(equalToConstant: 40),
            answersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            answerTextFieldA.topAnchor.constraint(equalTo: answersLabel.bottomAnchor, constant: 20),
            answerTextFieldA.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answerTextFieldA.heightAnchor.constraint(equalToConstant: 40),
            answerTextFieldA.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answerTextFieldA.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            answerTextFieldB.topAnchor.constraint(equalTo: answerTextFieldA.bottomAnchor, constant: 20),
            answerTextFieldB.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answerTextFieldB.heightAnchor.constraint(equalToConstant: 40),
            answerTextFieldB.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answerTextFieldB.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            answerTextFieldC.topAnchor.constraint(equalTo: answerTextFieldB.bottomAnchor, constant: 20),
            answerTextFieldC.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answerTextFieldC.heightAnchor.constraint(equalToConstant: 40),
            answerTextFieldC.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answerTextFieldC.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            answerTextFieldD.topAnchor.constraint(equalTo: answerTextFieldC.bottomAnchor, constant: 20),
            answerTextFieldD.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answerTextFieldD.heightAnchor.constraint(equalToConstant: 40),
            answerTextFieldD.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            answerTextFieldD.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            addButton.topAnchor.constraint(equalTo: answerTextFieldD.bottomAnchor, constant: 40),
            addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
            
        ])
    }
    
    func configureControl() {
        
        segmentedControl.didSelectItemWith = { [weak self] (index, title) -> () in
            guard let self = self else { return }
            
            switch index {
            case 0:
                return self.whichIsCorrect.optionA = true
            case 1:
                return self.whichIsCorrect.optionA = true
            case 2:
                return self.whichIsCorrect.optionA = true
            case 3:
                return self.whichIsCorrect.optionA = true
            default:
                return self.whichIsCorrect.optionA = true
            }
        }
    }
    
    
    
    @objc func loginButtonPressed(_ sender: Any) {
        //        let login = questionTextField.text!
        //        let password = answerTextFieldA.text!
        //        if login == "admin" && password == "123456" {
        //        } else {
        //            showLoginError()
        //        }
        
        questionAndAnswers = QuestionAndAnswers(question: questionTextField.text ?? "", // TODO: to add a check for the textfields
            answers: [
                Answer(text: "A:" + (answerTextFieldA.text ?? ""), isCorrect: whichIsCorrect.optionA),
                Answer(text: "B:" + (answerTextFieldB.text ?? ""), isCorrect: whichIsCorrect.optionB),
                Answer(text: "C:" + (answerTextFieldC.text ?? ""), isCorrect: whichIsCorrect.optionC),
                Answer(text: "D:" + (answerTextFieldD.text ?? ""), isCorrect: whichIsCorrect.optionD)
        ])
        
//        ModelFactory.array.append(questionAndAnswers!)
        
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Login Error", message: "No such user and pass found", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


