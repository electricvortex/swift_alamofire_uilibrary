//
//  ViewController.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/5/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var choosen: [String] = []
    var i: Int = 0
    let Q_test = Quiz.init().GenerateTest()
    
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

