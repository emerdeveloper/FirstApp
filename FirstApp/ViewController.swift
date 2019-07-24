//
//  ViewController.swift
//  FirstApp
//
//  Created by Emerson Javid Gonzalez Morales on 1/20/19.
//  Copyright © 2019 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    
    @IBOutlet weak var diceImageViewLeft: UIImageView!
    @IBOutlet weak var diceImageViewRight: UIImageView!
    @IBOutlet weak var changeImageButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateDiceImages()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
//        Type your code here
        changeButtonText()
    }
    
    func updateDiceImages() {
        let ramdonDiceLeft: Int = Int.random(in: 1 ... 6)
        let ramdonDiceRight: Int = Int.random(in: 1 ... 6)
        
        diceImageViewLeft.image = UIImage.init(named: "dice\(ramdonDiceLeft)")
        diceImageViewRight.image = UIImage.init(named: "dice\(ramdonDiceRight)")
    }
    
    func changeButtonText(){
        if changeImageButtom.titleLabel!.text! == "Roll" {
            changeImageButtom.setTitle( "Stop", for: .normal)
            startChangeImages()
        } else {
            changeImageButtom.setTitle( "Roll", for: .normal)
            finishChangeImages()
        }
    }
    
    func startChangeImages() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
            self.updateDiceImages()
        }
    }
    
    func finishChangeImages() {
        timer?.invalidate()
        timer = nil
    }
}

