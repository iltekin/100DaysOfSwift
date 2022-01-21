//
//  ViewController.swift
//  Objects
//
//  Created by Sezer İltekin on 15.01.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var objectNames = [String]()
    var objectIds = [UUID]()
    var chosenUUID: UUID?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Objects Around Me"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.hidesBackButton = true
        
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: NSNotification.Name(rawValue: "newDataAdded"), object: nil)
    }
    
    @objc func fetchData(){
        objectNames.removeAll(keepingCapacity: false)
        objectIds.removeAll(keepingCapacity: false)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Objects")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let object = result.value(forKey: "type") as? String {
                        objectNames.append(object)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        objectIds.append(id)
                    }
                    
                    tableView.reloadData()
                }
            }
            
            print("Data fetched successfully!")
            
        } catch {
            print("An error occured when fetching data!")
        }
    }
    
    @objc func addTapped(){
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = objectNames[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenUUID = objectIds[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toObjectVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toObjectVC" {
            let objectVC = segue.destination as! ObjectViewController
            objectVC.chosenUUID = chosenUUID
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Objects")
            let uuidString = objectIds[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if (result.value(forKey: "id") as? UUID) != nil {
                            context.delete(result)
                            objectIds.remove(at: indexPath.row)
                            objectNames.remove(at: indexPath.row)
                            self.tableView.reloadData()
                        }
                        break
                    }
                    
                    do {
                        try context.save()
                    } catch {
                        print("Error!")
                    }
                    
                }
                
            } catch {
                print("Error!")
            }
            
            
        }
        
    }
    

}

