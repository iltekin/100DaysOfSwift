//
//  ViewController.swift
//  LocationApp
//
//  Created by Sezer İltekin on 5.02.2022.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    var selectedLatitude = Double()
    var selectedLongitude = Double()
    
    var receivedName = ""
    var receivedId: UUID?

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Place"
        saveButton.isEnabled = false
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        let dismissKeyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(dismissKeyboardRecognizer)
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(selectLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 1
        mapView.addGestureRecognizer(gestureRecognizer)
        
        if receivedName != "" {
            if let id = receivedId?.uuidString {
                fillData(id: id)
            }
        } else {
            locationManager.startUpdatingLocation()
        }
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func selectLocation(gestureRecognizer: UILongPressGestureRecognizer){
        
        if gestureRecognizer.state == .began {
            
            let annotations = mapView.annotations
            if !annotations.isEmpty{
                mapView.removeAnnotations(annotations)
            }
            
            let touchPoint = gestureRecognizer.location(in: mapView)
            let touchToCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            selectedLatitude = touchToCoordinate.latitude
            selectedLongitude = touchToCoordinate.longitude

            let annotation = MKPointAnnotation()
            annotation.coordinate = touchToCoordinate
            annotation.title = nameTextField.text
            annotation.subtitle = descriptionTextField.text
            mapView.addAnnotation(annotation)
            saveButton.isEnabled = true
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latitude = locations[0].coordinate.latitude
        let longitude = locations[0].coordinate.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span )
        
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func saveLocation(_ sender: Any) {
        
        if nameTextField.text == "" {
            showAlert(title: "One more step", message: "You must provide a name for place", buttonText: "OK")
            redBorder(textfield: nameTextField)
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameTextField.text, forKey: "name")
        newPlace.setValue(descriptionTextField.text, forKey: "desc")
        newPlace.setValue(selectedLatitude, forKey: "latitude")
        newPlace.setValue(selectedLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "newPlace"), object: nil)
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error!")
        }

    }
    
    func showAlert(title: String, message: String, buttonText: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: buttonText, style: .default, handler: nil)
        alertController.addAction(alertButton)
        present(alertController, animated: true)
    }
    
    func redBorder(textfield: UITextField){
        textfield.layer.cornerRadius = 4
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.red.cgColor
    }
    
    func fillData(id: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        if let desc = result.value(forKey: "desc") as? String {
                            if let latitude = result.value(forKey: "latitude") as? Double {
                                if let longitude = result.value(forKey: "longitude") as? Double {
                                    nameTextField.text = name
                                    descriptionTextField.text = desc
                                    
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                    let region = MKCoordinateRegion(center: coordinate, span: span )
                                    mapView.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    annotation.subtitle = desc
                                    mapView.addAnnotation(annotation)
                                    
                                    saveButton.isEnabled = false
                                }
                            }
                        }
                    }
                    
                }
            }
        } catch {
            print("Error!")
        }
        
    }
    
}

