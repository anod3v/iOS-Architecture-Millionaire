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

struct QuestionAndAnswers {
    let question: String
    let answers: [Answer]
    
    internal init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}

struct Answer {
    let text: String
    let isCorrect: Bool
    
    internal init(text: String, isCorrect: Bool) {
        self.text = text
        self.isCorrect = isCorrect
    }
}

class ModelFactory {
    static func getQuestionsAndAnswers() -> [QuestionAndAnswers] {
        let questionAndAnswers1 = QuestionAndAnswers(question: "Кто 1-м получил Нобелевскую премию по литературе?", answers: [
            Answer(text: "A: Романист", isCorrect: false),
            Answer(text: "B: Драматург", isCorrect: false),
            Answer(text: "C: Поэт", isCorrect: true),
            Answer(text: "D: Эссеист", isCorrect: false)
        ])
        let questionAndAnswers2 = QuestionAndAnswers(question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?", answers: [
            Answer(text: "A: М", isCorrect: true),
            Answer(text: "B: Н", isCorrect: false),
            Answer(text: "C: О", isCorrect: false),
            Answer(text: "D: П", isCorrect: false)
        ])
        let questionAndAnswers3 = QuestionAndAnswers(question: "Кто из перечисленных был пажом во времена Екатерины II?", answers: [
            Answer(text: "A: Д.И. Фонвизин", isCorrect: false),
            Answer(text: "B: Г.Р. Державин", isCorrect: false),
            Answer(text: "C: А.Н. Радищев", isCorrect: true),
            Answer(text: "D: Н.М. Карамзин", isCorrect: false)
        ])
        
        var array = [
            questionAndAnswers1,
            questionAndAnswers2,
            questionAndAnswers3
        ]
        return array
    }
}
