//
//  scoreVC.swift
//  GuessTheFlag
//
//  Created by Sezer İltekin on 18.11.2021.
//

import UIKit

class scoreVC: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = receivedData

    }

}
