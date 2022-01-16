//
//  ViewController.swift
//  Objects
//
//  Created by Sezer İltekin on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
    }
    
    @objc func addTapped(){
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }


}

