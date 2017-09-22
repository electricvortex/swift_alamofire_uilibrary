//
//  SecondViewController.swift
//  lab2
//
//  Created by Sattar Salambayev on 9/22/17.
//  Copyright © 2017 Sattar Salambayev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var choosen_answers: [String]!
    var testItself: [Question]!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItself.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
        cell.yourAnswer.text = choosen_answers[indexPath.row]
        cell.rightAnswer.text = testItself[indexPath.row].answer
        
        if (choosen_answers[indexPath.row] == testItself[indexPath.row].answer){
            cell.backgroundColor = UIColor.green
        }
        else{
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backSegue" {
            let firstViewController = segue.destination as! ViewController
            firstViewController.choosen = []
            firstViewController.i = 0
        }
    }
    
}
