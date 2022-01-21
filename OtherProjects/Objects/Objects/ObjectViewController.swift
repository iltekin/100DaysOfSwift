//
//  ObjectViewController.swift
//  Objects
//
//  Created by Sezer İltekin on 21.01.2022.
//

import UIKit
import CoreData

class ObjectViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var adddateLabel: UILabel!
    
    var chosenUUID: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let chosenUUID = chosenUUID {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Objects")
            fetchRequest.predicate = NSPredicate(format: "id = %@", chosenUUID.uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let photoData = result.value(forKey: "photo") as? Data {
                            let photo = UIImage(data: photoData)
                            imageView.image = photo
                        }
                        if let type = result.value(forKey: "type") as? String {
                            typeLabel.text = type
                        }
                        if let price = result.value(forKey: "price") as? Float {
                            priceLabel.text = String(price)
                        }
                        if let adddate = result.value(forKey: "adddate") as? Date {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .full
                            let date = dateFormatter.string(from: adddate)
                            adddateLabel.text = date
                        }
                    }
                }
            } catch {
                print("Error!")
            }
        }
    }
}
