//
//  TextField.swift
//  Millionaire
//
//  Created by Andrey on 21/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import UIKit

class StyledTextField: UITextField {
    let insetConstant = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(white: 2/3, alpha: 0.5).cgColor
        self.layer.borderWidth = 1
        self.clearButtonMode = .whileEditing
        self.keyboardType = UIKeyboardType.decimalPad
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


