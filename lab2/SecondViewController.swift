//
//  SecondViewController.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/5/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var score_cnt: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = "You passed \(score_cnt!) of 3 questions"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var score: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
