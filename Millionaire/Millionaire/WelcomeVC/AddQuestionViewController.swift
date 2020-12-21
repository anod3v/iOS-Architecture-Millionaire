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

class AddQuestionViewController: UIViewController {
    
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
    
    let loginInputField: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Введите вопрос"
        
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
    
    let passwordInputField: StyledTextField = {
        let field = StyledTextField()
        field.backgroundColor = .white
        field.placeholder = "Вариант А"
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
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
        contentView.addSubview(loginInputField)
        contentView.addSubview(answersLabel)
        contentView.addSubview(passwordInputField)
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
            
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            questionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 40),
            questionLabel.widthAnchor.constraint(equalToConstant: 200),
            
            loginInputField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40),
            loginInputField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginInputField.heightAnchor.constraint(equalToConstant: 40),
            loginInputField.widthAnchor.constraint(equalToConstant: 200),
            
            answersLabel.topAnchor.constraint(equalTo: loginInputField.bottomAnchor, constant: 40),
            answersLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            answersLabel.heightAnchor.constraint(equalToConstant: 40),
            answersLabel.widthAnchor.constraint(equalToConstant: 200),
            
            passwordInputField.topAnchor.constraint(equalTo: answersLabel.bottomAnchor, constant: 40),
            passwordInputField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordInputField.heightAnchor.constraint(equalToConstant: 40),
            passwordInputField.widthAnchor.constraint(equalToConstant: 200),

            addButton.topAnchor.constraint(equalTo: passwordInputField.bottomAnchor, constant: 40),
            addButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 200),
            
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
            
        ])
    }
    
    
    @objc func loginButtonPressed(_ sender: Any) {
                // Получаем текст логина
                let login = loginInputField.text!
        //         Получаем текст-пароль
                let password = passwordInputField.text!
        
//                let mainTabBarViewController = MainTabBarViewController()
        
                // Проверяем, верны ли они
                if login == "admin" && password == "123456" {
                    //            print("successfully authorized")
//                    mainTabBarViewController.modalPresentationStyle = .fullScreen
//                    self.present(mainTabBarViewController, animated: true, completion: nil)
//                    self.show(userFriendsViewController, sender: nil)
                } else {
                    //            print("authorization failed")
                    showLoginError()
                }
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


