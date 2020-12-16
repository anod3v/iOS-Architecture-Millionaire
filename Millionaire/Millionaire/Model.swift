//
//  Model.swift
//  Millionaire
//
//  Created by Andrey on 16/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

struct Record {
    let userName: String
    let result: Int
    
    init(userName: String, result: Int) {
        self.userName = userName
        self.result = result
    }
}
