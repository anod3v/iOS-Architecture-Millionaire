//
//  GameSession.swift
//  Millionaire
//
//  Created by Andrey on 17/12/2020.
//  Copyright © 2020 Andrey Anoshkin. All rights reserved.
//

import Foundation

class GameSession {
    var noOfQuestionsAnsweredSoFar: Int?
    var noOfQuestionsTotal: Int?
    var ResultPercentage: Int { noOfQuestionsAnsweredSoFar! / noOfQuestionsTotal! * 100 }
}
