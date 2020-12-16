//
//  AnswerButton.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {
    
    var borderWidth:CGFloat = 1
    var cornerRadius:CGFloat = 10
    var label = UILabel()
    var isActive: Bool = false { didSet { changeActiveState() } }
    var answerIsCorrect: Bool
    
    private let border = CAShapeLayer()
    
    init(frame: CGRect, titleText: String, answerIsCorrect: Bool) {

        self.label.text = titleText
        self.answerIsCorrect = answerIsCorrect
        super.init(frame: frame)
//        label.font = UIFont(name: "Montserrat-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        setupConstraints()
        setInactive()
        self.addTarget(self, action: #selector(checkIfCorrect), for: .touchUpInside)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checkIfCorrect() {
        if answerIsCorrect {
            print("correct answer!!")
        } else {
            print("incorrect answer!!")
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        if isActive {
            setActive()
        } else {
            setInactive()
        }
        
    }
    
    func changeActiveState() {
        
        if isActive {
            setActive()
        } else {
            setInactive()
        }
    }
    
    func setActive() {
        self.isEnabled = true
        self.backgroundColor = .blue
        label.textColor = .white
        
    }
    
    func setInactive() {
        self.isEnabled = true
        self.backgroundColor = .gray
        label.textColor = .white
    }
    
}

