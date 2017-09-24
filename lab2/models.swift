//
//  models.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/24/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import Foundation

var test: [Question] = []

struct Question{
    var question_itself: String
    var options: [String]
    var answer: String
    
    
    init(quest:String, opts: [String], ans:String){
        self.question_itself = quest
        self.options = opts
        self.answer = ans
        test.append(self)
    }
}

struct Quiz{
    init() {
        GenerateTest()
    }
    
    func GenerateTest() -> [Question]{
        var Q: [Question] = [Question(quest: "Who is Stronger?", opts: ["Batman", "Superman", "Wonder Woman"] , ans:  "Superman"), Question(quest: "Who made Python? ", opts: ["Rossum", "Linus", "Gabe"], ans: "Rossum"), Question(quest: "God of Thunder?", opts: ["Zeus", "Jupyter", "Osiris"], ans: "Zeus"), Question(quest: "Game of ???", opts: ["Thrones", "Mems", "Swords"], ans: "Thrones"),
                             Question(quest: "Last Iphone: ", opts: ["X", "10", "9"], ans: "X"), Question(quest: "How many songs in Itunes?", opts: ["10mln", "20mln", "35mln"], ans: "35mln"), Question(quest: "Google programming language?", opts: ["Go", "Swift", "C#"], ans: "Go"),
                             Question(quest: "Capital of Great Britain", opts: ["New York", "Atlanta", "London"], ans: "London"),
                             Question(quest: "DotA2 first contest: ", opts: ["Major", "International", "Esports"], ans: "International" )]
        
        var output: [Question] = []
        for _ in 0...5{
            output.append(Q[Int(arc4random_uniform(UInt32(Q.count)))])
        }
        return output
    }
}
