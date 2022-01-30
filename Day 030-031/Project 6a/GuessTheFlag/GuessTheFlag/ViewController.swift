//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Sezer İltekin on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var currentRank: UILabel!
    @IBOutlet var countryLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var tried = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("turkey")
        countries.append("uk")
        countries.append("us")
        
        askQuestion()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        score = 0
        tried = 0
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil){
        
        countries.shuffle()
        correctAnswer = .random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countryLabel.text = countries[correctAnswer].uppercased()
        currentRank.text = String(score)
        title = "Guess The Flag (\(tried+1)/10)"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        tried += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
        }
                
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        
        if(tried >= 10){
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        } else {
            present(ac, animated: true)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScoreVC" {
            let destinationVC = segue.destination as! scoreVC
            destinationVC.receivedData = String(score)
        }
    }
    

}

