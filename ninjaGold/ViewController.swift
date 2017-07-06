//
//  ViewController.swift
//  ninjaGold
//
//  Created by Erick Lui on 7/5/17.
//  Copyright © 2017 Erick Lui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var score = 0
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var farmLabel: UILabel!
  @IBOutlet weak var caveLabel: UILabel!
  @IBOutlet weak var houseLabel: UILabel!
  @IBOutlet weak var casinoLabel: UILabel!
  
  @IBAction func buildingButtonPress(_ sender: UIButton) {
    // Farm 10 - 20
    if sender.tag == 1 {
      let gold = Int(arc4random_uniform(UInt32(11))) + 10
      score += gold
      displayLabel(name: "farm", score: gold)
    }
    // Cave 5 - 10
    else if sender.tag == 2 {
      let gold = Int(arc4random_uniform(UInt32(6))) + 5
      score += gold
      displayLabel(name: "cave", score: gold)
    }
    // House 2 - 5
    else if sender.tag == 3 {
      let gold = Int(arc4random_uniform(UInt32(4))) + 2
      score += gold
      displayLabel(name: "house", score: gold)
    }
    // Casino -50 - +50
    else {
      let gold = Int(arc4random_uniform(UInt32(101))) - 50
      score += gold
      if score < 0 {
        score = 0
      }
      displayLabel(name: "casino", score: gold)
    }
    scoreLabel.text = "Score: " + String(score)
  }
  @IBAction func resetButtonPressed(_ sender: UIButton) {
    reset()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    reset()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func reset() {
    farmLabel.isHidden = true
    caveLabel.isHidden = true
    houseLabel.isHidden = true
    casinoLabel.isHidden = true
    scoreLabel.text = "Score: 0"
  }
  func displayLabel(name: String, score: Int) {
    if name == "farm" {
      farmLabel.isHidden = false
      caveLabel.isHidden = true
      houseLabel.isHidden = true
      casinoLabel.isHidden = true
      farmLabel.text = "You earned " + String(score)
    }
    else if name == "cave" {
      farmLabel.isHidden = true
      caveLabel.isHidden = false
      houseLabel.isHidden = true
      casinoLabel.isHidden = true
      caveLabel.text = "You earned " + String(score)
    }
    else if name == "house" {
      farmLabel.isHidden = true
      caveLabel.isHidden = true
      houseLabel.isHidden = false
      casinoLabel.isHidden = true
      houseLabel.text = "You earned " + String(score)
    }
    else {
      farmLabel.isHidden = true
      caveLabel.isHidden = true
      houseLabel.isHidden = true
      casinoLabel.isHidden = false
      if score > 0 {
        casinoLabel.text = "You earned " + String(score)
      } else {
        casinoLabel.text = "You lost " + String(score)
      }
    }
  }
}

