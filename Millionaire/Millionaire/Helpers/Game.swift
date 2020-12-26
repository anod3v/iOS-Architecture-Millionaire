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
    private let questionsAndAnswersCaretaker = QuestionsAndAnswersCaretaker()
    
    var orderedOrRandomSetting = OrderedOrRandomSetting.random
        
    { didSet { print("orderedOrRandomSetting SINGLETONE:", orderedOrRandomSetting) }}
    
    var gameSession: GameSession?
    
    var records: [Record] {
        didSet {
            recordCaretaker.saveRecords(records: records)
        }
    }
    
    var questionsAndAnswers: [QuestionAndAnswers] {
        didSet {
            questionsAndAnswersCaretaker.saveRecords(records: questionsAndAnswers)
        }
    }
    
    
    private init() {
        records  = recordCaretaker.loadRecords()
        questionsAndAnswers = questionsAndAnswersCaretaker.loadRecords()
        if questionsAndAnswers.count <= 10 {
            questionsAndAnswers = ModelFactory.getQuestionsAndAnswers()
        }
    }
    
    func addQuestion(_ questionAndAnswers: QuestionAndAnswers) {
        questionsAndAnswers.append(questionAndAnswers)
    }
    
    func clearQuestions() {
        questionsAndAnswers.removeAll()
    }
    
    
    
    func addRecord(_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records.removeAll()
    }
    
}
