//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Andrey on 20/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let segmentedControl: TTSegmentedControl = {
        let control = TTSegmentedControl()
        control.allowChangeThumbWidth = false
        //        control.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        control.didSelectItemWith = { (index, title) -> () in
            print("Selected item \(index)")
        }
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        self.view.addSubview(segmentedControl)
    }
    
//    @objc func playButtonAction(sender: UIButton!) {
//        let gameViewController = GameViewController(listOfQuestions: self.listOfQuestions)
//        gameViewController.modalPresentationStyle = .fullScreen
//        gameViewController.delegate = GameSession()
//        self.show(gameViewController, sender: nil)
//    }
//    
//    @objc func resultsButtonAction(sender: UIButton!) {
//        let resultsViewController = ResultsViewController()
//        //        resultsViewController.modalPresentationStyle = .fullScreen
//        self.show(resultsViewController, sender: nil)
//    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 3),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}

