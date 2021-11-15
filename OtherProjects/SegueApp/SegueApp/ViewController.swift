//
//  ViewController.swift
//  SegueApp
//
//  Created by Sezer İltekin on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstVC: UILabel!
    @IBOutlet weak var textField: UITextField!
    var myData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.textField.text = ""
        print("text field cleared")
    }
    
    @IBAction func checkData(_ sender: Any) {
        myData = textField.text!
        if(myData == "1923"){
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        } else {
            let alertMessage = UIAlertController(title: "Error", message: "Wrong Password!", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default) { UIAlertAction in
                print("User is retrying for password")
            }
            
            alertMessage.addAction(okButton)
            self.present(alertMessage, animated: true) {
                self.textField.text = ""
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.receivedData = myData
        }
    }
    
}

