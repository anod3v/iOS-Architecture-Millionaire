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
        control.itemTitles = ["Случайно","По порядку"]
        control.selectedTextFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(0.3))
        control.defaultTextFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(0.01))
        control.useGradient = false
        control.thumbColor = TTSegmentedControl.UIColorFromRGB(0x1FDB58)
        control.useShadow = false
        control.cornerRadius = 5
        control.thumbShadowColor = TTSegmentedControl.UIColorFromRGB(0x56D37C)
        control.allowChangeThumbWidth = false
        
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private var selectedOrder = OrderedOrRandomSetting.random { didSet { print("selectedOrder:", selectedOrder)} }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        addSubviews()
        setupConstraints()
        addGestureRecognizer()
    }
    
    func addSubviews() {
        self.view.addSubview(segmentedControl)
    }
    
    func addGestureRecognizer() {
        segmentedControl.didSelectItemWith = { (index, title) -> () in
            switch index {
            case 0:
                self.selectedOrder = .random
            case 1:
                self.selectedOrder = .ordered
            default:
                self.selectedOrder = .random
            }
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 3),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}

