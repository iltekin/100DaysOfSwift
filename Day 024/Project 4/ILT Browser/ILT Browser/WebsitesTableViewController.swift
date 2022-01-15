//
//  WebsitesTableViewController.swift
//  ILT Browser
//
//  Created by Sezer İltekin on 15.01.2022.
//

import UIKit

class WebsitesTableViewController: UITableViewController {
    var websites = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ILT Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebKitVC") as? ViewController {
            websites = vc.websites
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebKitVC") as? ViewController {
            vc.initialWebsite = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
