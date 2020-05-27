//
//  ViewController.swift
//  Corona Clicker
//
//  Created by sigil wen on 2020-05-25.
//  Copyright © 2020 Sigil Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pointsOutput: UILabel!
    @IBOutlet weak var rateOutput: UILabel!
    
    //variables
    var points = 0
    var rate = 0
    var timer = Timer()

    @IBAction func clicker(_ sender: Any) {
        points = points + 1
        pointsOutput.text = String(points)
    }
    @IBAction func upgradeOne(_ sender: Any) {
        rate = rate + 1
        points = points - 1
        rateOutput.text = String(rate)

    }
    @objc func timerAction(){
       points = points + rate
       pointsOutput.text = String(points)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        pointsOutput.text = String(points)

        rateOutput.text = String(rate)

    }


}

