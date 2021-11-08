//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Sezer İltekin on 7.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func doAddition(_ sender: Any) {
        if let firstInt = Int(firstNumber.text!) {
            if let secondInt = Int(secondNumber.text!) {
                result = firstInt + secondInt
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func doSubtraction(_ sender: Any) {
        if let firstInt = Int(firstNumber.text!) {
            if let secondInt = Int(secondNumber.text!) {
                result = firstInt - secondInt
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func doMultiplication(_ sender: Any) {
        if let firstInt = Int(firstNumber.text!) {
            if let secondInt = Int(secondNumber.text!) {
                result = firstInt * secondInt
                resultLabel.text = String(result)
            }
        }
    }
    
    @IBAction func doDivision(_ sender: Any) {
        if let firstInt = Int(firstNumber.text!) {
            if let secondInt = Int(secondNumber.text!) {
                result = firstInt / secondInt
                resultLabel.text = String(result)
            }
        }
    }
    
    
}

