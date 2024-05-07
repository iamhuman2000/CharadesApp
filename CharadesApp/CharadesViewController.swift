//
//  CharadesViewController.swift
//  CharadesApp
//
//  Created by Anika  on 5/6/24.
//

import UIKit

class CharadesViewController: UIViewController {

    @IBOutlet weak var AnimalLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let words = ["Frog","Bird","Cat","Snake","Bunny","Lion","Monkey","Shark","Unicorn","Elephant"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AnimalLabel.text = words[0]
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }

    @objc func runTimer(){
        print("a second later")
    }

}


