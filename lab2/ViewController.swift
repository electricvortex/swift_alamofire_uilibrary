//
//  ViewController.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/5/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit

var test: [Question] = []
var cnt = 0
var i: Int = 0

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

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (sender.currentTitle == Q_test[i].answer){
            cnt += 1
        }
        if (i < Q_test.count-1){
            i += 1
            draw()
        }
        else{
            performSegue(withIdentifier: "second", sender: self)
        }
    }
    
    var Q_test: [Question] = [Question(quest: "Who is Stronger?", opts: ["Batman", "Superman", "Wonder Woman"] , ans:  "Superman"), Question(quest: "Who made Python? ", opts: ["Rossum", "Linus", "Gabe"], ans: "Rossum"), Question(quest: "God of Thunder?", opts: ["Zeus", "Jupyter", "Osiris"], ans: "Zeus")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        draw()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.score_cnt = cnt
    }
    
    func draw(){
        questionLabel.text = Q_test[i].question_itself
        btn1.setTitle(Q_test[i].options[0], for: [])
        btn2.setTitle(Q_test[i].options[1], for: [])
        btn3.setTitle(Q_test[i].options[2], for: [])
    }
    

}

