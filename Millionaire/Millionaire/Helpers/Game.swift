//
//  Game.swift
//  Millionaire
//
//  Created by Andrey on 17/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    private let recordCaretaker = RecordsCaretaker()
    
    var gameSession: GameSession?
    
    var records: [Record] {
        didSet {
            recordCaretaker.saveRecords(records: records)
        }
    }
    
    private init() {
        records  = recordCaretaker.loadRecords()
    }
    
    
    
    func addRecord(_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records.removeAll()
    }
    
}
