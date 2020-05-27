//
//  ViewController.swift
//  Piano Tilez
//
//  Created by sigil wen on 2020-05-26.
//  Copyright © 2020 Sigil Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //variables
    var tiles = Array(repeating: Array(repeating: false, count: 4), count: 6) //creates a 4x6 boolean array to store whether a tile is
    var points = 0; // variable that stores the current games points
    var highPoints = 0; //variable that stores the highest scored game
    

    @IBOutlet weak var score: UILabel! //Declaring Score UILable
    @IBOutlet weak var highScore: UILabel! //Declaring highScore UILabel
    
    //Top Row Tiles
    @IBOutlet weak var aa: UILabel!
    @IBOutlet weak var ab: UILabel!
    @IBOutlet weak var ac: UILabel!
    @IBOutlet weak var ad: UILabel!
    //Second Row Tiles
    @IBOutlet weak var ba: UILabel!
    @IBOutlet weak var bb: UILabel!
    @IBOutlet weak var bc: UILabel!
    @IBOutlet weak var bd: UILabel!
    //third row tiles
    @IBOutlet weak var ca: UILabel!
    @IBOutlet weak var cb: UILabel!
    @IBOutlet weak var cc: UILabel!
    @IBOutlet weak var cd: UILabel!
    //fourth row tiles
    @IBOutlet weak var da: UILabel!
    @IBOutlet weak var db: UILabel!
    @IBOutlet weak var dc: UILabel!
    @IBOutlet weak var dd: UILabel!
    //fifth row tiles
    @IBOutlet weak var ea: UILabel!
    @IBOutlet weak var eb: UILabel!
    @IBOutlet weak var ec: UILabel!
    @IBOutlet weak var ed: UILabel!
    //sixth row tiles
    @IBOutlet weak var fa: UILabel!
    @IBOutlet weak var fb: UILabel!
    @IBOutlet weak var fc: UILabel!
    @IBOutlet weak var fd: UILabel!
    
    //creating an array to store each tile UILabel (24 different labels) for easier access
    private var tileLabels = [UILabel]()
    
    func createTileLabels(){ //appends each tile to the tileLabels array
        tileLabels.append(aa)
        tileLabels.append(ab)
        tileLabels.append(ac)
        tileLabels.append(ad)
        tileLabels.append(ba)
        tileLabels.append(bb)
        tileLabels.append(bc)
        tileLabels.append(bd)
        tileLabels.append(ca)
        tileLabels.append(cb)
        tileLabels.append(cc)
        tileLabels.append(cd)
        tileLabels.append(da)
        tileLabels.append(db)
        tileLabels.append(dc)
        tileLabels.append(dd)
        tileLabels.append(ea)
        tileLabels.append(eb)
        tileLabels.append(ec)
        tileLabels.append(ed)
        tileLabels.append(fa)
        tileLabels.append(fb)
        tileLabels.append(fc)
        tileLabels.append(fd)
    }
    
    //4 buttons at the bottom
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    
    
    
    //Function is called when firstbutton is clicked
    @IBAction func firstButton(_ sender: Any) {
        checkCorrect(val: 0)
        generateTiles()
        displayTiles()
    }
    
    //Function is called when secondbutton is clicked
    @IBAction func secondButton(_ sender: Any) {
        checkCorrect(val: 1)
        generateTiles()
        displayTiles()
    }
    
    //Function is called when thirdbutton is clicked
    @IBAction func thirdButton(_ sender: Any) {
        checkCorrect(val: 2)
        generateTiles()
        displayTiles()
    }
    
    //Function is called when fourthbutton is clicked
    @IBAction func fourthButton(_ sender: Any) {
        checkCorrect(val: 3)
        generateTiles()
        displayTiles()
    }
    
    //Takes in integer parameter to determine whether it is the correct tile
    func checkCorrect(val: Int){
        if (tiles[5][val]){ //if the selected tile is black
            points = points + 1 //increases points by one
            score.text = String(points)// updates the score display
            colorButtons(color: UIColor.gray) //colors the buttons gray
        }else{
           ifFail()
        }
    }
    
    func ifFail(){
        if (highPoints < points){ //checks if the current game score beats highscore
            highPoints = points //sets highscore if true
        }
        highScore.text = String(highPoints) //updates highscore display
        points = 0 //sets points back to zero
        score.text = String(points) // updates the score display
        colorButtons(color: UIColor.red) //colors to buttons red to indicate that a mistake has been made and game restarts
    }
    
    //colors the buttons given a UIColor
    func colorButtons(color: UIColor){
        (aButton!).backgroundColor = color
        (bButton!).backgroundColor = color
        (cButton!).backgroundColor = color
        (dButton!).backgroundColor = color
    }
    
    func generateTiles(){ //Generates a row of new tiles and shifts everything down
        for line in 1...5{
            for index in 0...3{
            tiles[6-line][index] = tiles[5-line][index]
            }
        }
        tiles[0][0] = false
        tiles[0][1] = false
        tiles[0][2] = false
        tiles[0][3] = false
        let number = Int.random(in: 0 ... 3) //randomly generates a new tile
        tiles[0][number] = true
    }
    
    func displayTiles(){ //changes the colors of all the tiles using the values of the tiles array
        var count = 0 //creates a count variable to use as an index for tileLabels
        for i in 0...5{
            for j in 0...3{
                if (tiles[i][j]){
                    tileLabels[count].backgroundColor = .black
                }else{
                    tileLabels[count].backgroundColor = .white
                }
                count = count + 1
            }
        }
    }
    func initTiles(){ //initializes the tiles in the beginning
        for line in 0...5 {
            let number = Int.random(in: 0 ... 3)
            tiles[line][number] = true
        }
    }
    
    //viewDidLoad() is called when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTiles()
        score.text = String(points)
        createTileLabels()
        displayTiles()
        highScore.text = String(highPoints)
        colorButtons(color: UIColor.gray)
    }
}

