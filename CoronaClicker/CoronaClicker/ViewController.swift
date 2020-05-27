//
//  ViewController.swift
//  CoronaClicker
//
//  Created by sigil wen on 2020-05-25.
//  Copyright © 2020 Sigil Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//pandemic simulation outlets
    @IBOutlet weak var susceptibleOutput: UILabel!
    @IBOutlet weak var infectiousOutput: UILabel!
    @IBOutlet weak var recoveredOutput: UILabel!
    @IBOutlet weak var deathsOutput: UILabel!
    @IBOutlet weak var rNaughtOutput: UILabel!
    @IBOutlet weak var mortalityOutput: UILabel!
    
    
//game outlets
    @IBOutlet weak var newsOutput: UILabel!
    
//variables
    var population = 7594293783
    var susceptible = [7594293783]
    var infectious = [10]
    var newInfectious = [1]
    var rNaught = [2.0]
    var mortality = [0.2]
    var researchMultiplier = 1
    var infectiousDuration = 14
//timer
    var timer = Timer()
    var days = 0
    @IBOutlet weak var daysOutput: UILabel!
    @objc func timerAction(){
        days = days + 1
        daysOutput.text = String(days)
        adjustPandemic()
        
      }
// pandemic calculations
    func adjustPandemic(){
        adjustRNaught()
        adjustInfections()
        adjustRemoved()
        adjustSusceptable()
        infectiousOutput.text = String(infectious[days])
        rNaughtOutput.text = String(rNaught[days])
        recoveredOutput.text = String(recovered[days])
        deathsOutput.text = String(deaths[days])
        susceptibleOutput.text = String(susceptible[days])
    }
    func adjustRNaught(){
        rNaught.append((Double(susceptible[days-1])/Double(population))*rNaught[0])
      }
    func adjustInfections(){
      
        
        newInfectious.append( Int(Double(newInfectious[days-1])*rNaught[days]))
        infectious.append( infectious[days-1] + newInfectious[days])
    }
    func adjustSusceptable(){
        susceptible.append(population-infectious[days]-deaths[days]-recovered[days])
      }

    func adjustRemoved(){
        if (days > infectiousDuration){
            infectious[days] = infectious[days] - newInfectious[days-infectiousDuration]
            deaths.append(deaths[days-1] + Int(Double(newInfectious[days-infectiousDuration])*mortality[0]))
            recovered.append(recovered[days-1] + newInfectious[days-infectiousDuration] - deaths[days])
        }else{
            recovered.append(0)
            deaths.append(0)
        }
    }
  
  
    
    
//research clicker
    @IBAction func pauseTime(_ sender: Any) {
    if (timer.isValid){
               timer.invalidate()
    }else{
timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)    }
    }
    
    
    
//upgrade mechanics
    
    func pointError() {
        newsOutput.text = "You do not have enough evolution points for that"
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsOutput.text = "Welcome to CoronaClicker. This game simulates a global pandemic"
        susceptibleOutput.text = String(susceptible[days])
        infectiousOutput.text = String(infectious[days])
        recoveredOutput.text = String(recovered[days])
        deathsOutput.text = String(deaths[days])
        rNaughtOutput.text = String(rNaught[days])
        mortalityOutput.text = String(mortality[days])
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        daysOutput.text = String(days)

        
    }


}

