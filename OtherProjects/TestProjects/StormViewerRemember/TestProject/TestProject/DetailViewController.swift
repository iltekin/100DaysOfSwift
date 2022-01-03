//
//  DetailViewController.swift
//  TestProject
//
//  Created by Sezer İltekin on 29.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var imageCount: Int?
    var imageNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        if let totalImages = imageCount {
            if let thisImage = imageNumber {
                title = "\(thisImage) / \(totalImages)"
            }
        }
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
}
