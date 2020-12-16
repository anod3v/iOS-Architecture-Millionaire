//
//  GameViewController.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let ButtonA: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: String(), answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ButtonB: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: String(), answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ButtonC: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: String(), answerIsCorrect: false)

        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ButtonD: AnswerButton = {
        let button = AnswerButton(frame: .zero, titleText: String(), answerIsCorrect: false)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
    }
    
}


