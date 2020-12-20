//
//  GetQuestionsRandomly.swift
//  Millionaire
//
//  Created by Andrey on 20/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class GetQuestionsRandomly: GetQuestionsStrategy {
    func getQuestions() -> [QuestionAndAnswers] {
        
        let array = ModelFactory.getQuestionsAndAnswers()
        return array.shuffled()
        
    }
}
