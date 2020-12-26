//
//  GetQuestionsStrategy.swift
//  Millionaire
//
//  Created by Andrey on 20/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

protocol GetQuestionsStrategy {
    func getQuestions() -> [QuestionAndAnswers]
}
