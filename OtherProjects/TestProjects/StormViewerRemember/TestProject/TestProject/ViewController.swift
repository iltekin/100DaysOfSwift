//
//  ViewController.swift
//  TestProject
//
//  Created by Sezer İltekin on 28.12.2021.
//

import UIKit

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}

class ViewController: UITableViewController {
    // pictures adında bir array oluşturduk
    var pictures = [String]()
    var cars = ["Audi", "Chery", "Fiat", "BMW", "Hyundai"]

    override func viewDidLoad() {
        // Üst view'a ait viewDidLoad fonksiyonunu çağırdık
        super.viewDidLoad()
        
        // navigationBar'daki Başlık. Zaten boş olarak mevcut olduğu için üzerine yazıyoruz.
        title = "Storm Photos"
        
        // navigationController var ise (?) navigationBar'daki başlığı Büyük yapıyoruz
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Burada Filemanager'ı bir değişkene atıyoruz
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
        // pictures array'ini numaralarına göre sıralıyoruz
        pictures.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count + 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= pictures.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
            cell.textLabel?.text = "Photo" + pictures[indexPath.row].digits
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Car", for: indexPath)
            cell.textLabel?.text = cars[indexPath.row - pictures.count]
            return cell
        }
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imageNumber = indexPath.row + 1
            
            if indexPath.row <= pictures.count - 1 {
                vc.selectedImage = pictures[indexPath.row]
                vc.imageCount = pictures.count
            } else {
                vc.selectedImage = "car.jpg"
                vc.imageCount = cars.count
            }
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if let url = URL(string: "https://iltekin.com/api/enpara.php") {
            if let data = try? Data(contentsOf: url) {
                
            }
        }
        
    }
    
}

