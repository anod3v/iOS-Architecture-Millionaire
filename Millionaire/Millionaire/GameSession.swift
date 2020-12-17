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
        let float = Float(index) / Float(count)
        let score = float * 100
        let record = Record(date: Date(), score: Int(score))
        debugPrint("\(record), index:", index, "count", count)
        Game.shared.addRecord(record)
    }
    
}
