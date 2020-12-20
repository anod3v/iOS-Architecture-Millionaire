//
//  File.swift
//  Millionaire
//
//  Created by Andrey on 20/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class GetQuestionsOrdered: GetQuestionsStrategy {
    func getQuestions() -> [QuestionAndAnswers] {
        var listOfQuestions: [QuestionAndAnswers] = {
            let array = ModelFactory.getQuestionsAndAnswers()
            return array
        }()
        return listOfQuestions
    }
}
