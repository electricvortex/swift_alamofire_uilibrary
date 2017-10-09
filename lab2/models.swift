//
//  models.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/24/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import Foundation


class Question{
    var question_itself: String
    var options: [String]
    var answer: String
    
    var test: [Question] = []
    
    init(quest:String, opts: [String], ans:String){
        self.question_itself = quest
        self.options = opts
        self.answer = ans
        test.append(self)
    }
}

class Quiz{
    
    var Q: Array<Question> = []
    
    init() {
    }
    
    func GenerateTest(Test: [Question]) -> [Question]{
        var output: [Question] = []
        for _ in 0...4{
            output.append(Test[Int(arc4random_uniform(UInt32(Test.count)))])
        }
        return output
    }
}
