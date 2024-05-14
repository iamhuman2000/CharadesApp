//
//  CharadesViewController.swift
//  CharadesApp
//
//  Created by Anika  on 5/6/24.
//

import UIKit
import CoreMotion


class CharadesViewController: UIViewController {

    @IBOutlet weak var AnimalLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    let motionManager = CMMotionManager()
    
    let words = ["Frog","Bird","Cat","Snake","Bunny","Lion","Monkey","Shark","Unicorn","Elephant"]
    var wordIndex = 0
    var isDebouncing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
            if data != nil {
                self.handleTilt(data!)
            }
        }
        showNextWord()
//   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    
    
    }
    
    func handleTilt(_ data: CMAccelerometerData) {
        if isDebouncing == true {
            return
        }
        let acceleration = data.acceleration
        let currentPosition = acceleration.z
        
        let upTilt = -0.8
        let downTilt = 0.8
        
        if currentPosition < upTilt{
//            tilt upward, skip
            print("Skip")
            waitForBounceBack()
            showNextWord()
        }
        if currentPosition > downTilt{
//            tile downward, pass
            print("Pass")
            waitForBounceBack()
            showNextWord()
        }
        
    }
    
    func showNextWord() {
        if wordIndex >= words.count{
            return
        } else {
            AnimalLabel.text = words [wordIndex]
            wordIndex += 1
        }
    }

    func waitForBounceBack() {
        isDebouncing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isDebouncing = false
        }
    }
}


