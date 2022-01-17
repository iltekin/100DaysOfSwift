//
//  DetailsViewController.swift
//  Objects
//
//  Created by Sezer İltekin on 16.01.2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blankAreaTapped))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapImage)
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
   
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let object = NSEntityDescription.insertNewObject(forEntityName: "Objects", into: context)
        
        object.setValue(UUID(), forKey: "id")
        object.setValue(typeTextField.text!, forKey: "type")
        object.setValue(datePicker.date, forKey: "adddate")
        
        if let price = Float(priceTextField.text!) {
            object.setValue(price, forKey: "price")
        }
        
        let photo = imageView.image!.jpegData(compressionQuality: 1)
        object.setValue(photo, forKey: "photo")
        
        do {
            try context.save()
            print("Data saved successfully!")
        } catch {
            print("An error occured when saving data!")
        }

    }
    
    @objc func blankAreaTapped(){
        view.endEditing(true)
    }
    
    @objc func imageTapped(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
}
