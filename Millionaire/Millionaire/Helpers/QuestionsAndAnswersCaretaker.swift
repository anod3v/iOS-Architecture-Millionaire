//
//  QuestionsAndAnswersCaretaker.swift
//  Millionaire
//
//  Created by Andrey on 21/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class QuestionsAndAnswersCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "key"
    
    func saveRecords(records: [QuestionAndAnswers]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [QuestionAndAnswers] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([QuestionAndAnswers].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
}

