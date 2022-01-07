//
//  DetailViewController.swift
//  Country Flags
//
//  Created by Sezer İltekin on 5.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var myLabel: UILabel!
    var flag: String?
    var country: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let flag = flag {
            imageView.image = UIImage(named: flag)
        }
        
        if let country = country {
            myLabel.text = country
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @objc func shareTapped(){
        if let image = imageView.image?.jpegData(compressionQuality: 0.8) {
            let shareVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            shareVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(shareVC, animated: true)
        }
    }
    
}
