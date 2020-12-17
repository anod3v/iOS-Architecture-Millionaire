//
//  GameSession.swift
//  Millionaire
//
//  Created by Andrey on 17/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class GameSession: GameSessionDelegate {
    func addRecord(index: Int, count: Int) {
        let score = index / count - 1
        let record = Record(date: Date(), score: score)
        debugPrint("\(record)")
        Game.shared.addRecord(record)
    }
    
//    internal init() {
//        GameViewController.delegate = self
//    }
    
}
