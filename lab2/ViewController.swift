//
//  ViewController.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/5/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {
    
    var choosen: [String] = []
    var i: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        choosen.append(sender.currentTitle!)
        if (i < Q_test.count-1){
            i += 1
            draw()
        }
        else{
            performSegue(withIdentifier: "mainSegue", sender: self)
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
        if segue.identifier == "mainSegue" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.choosen_answers = choosen
            secondViewController.testItself = Q_test
        }
    }

    func draw(){
        questionLabel.text = Q_test[i].question_itself
        var distance = 2
        
        for d in Q_test[i].options {
            let button = UIButton(frame: CGRect(x: 16, y: 7*(distance+10)+16, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
            button.backgroundColor = UIColor.blue
            button.setTitle(d, for: UIControlState.normal)
            button.addTarget(self, action:#selector(buttonPressed(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            distance += 15
        }
    }
    

}

