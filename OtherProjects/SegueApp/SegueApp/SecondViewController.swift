//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Sezer İltekin on 15.11.2021.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var secondVC: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var receivedData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = receivedData
        
    }

}
