//
//  MapViewController.swift
//  Telegramme
//
//  Created by Mohamed Thabith on 28/1/21.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController : UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLocationManager()
        createAnnotation()
        
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
                
                let longitude = location.coordinate.longitude
                let latitude = location.coordinate.latitude
                
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = "Me"
            
            mapView.addAnnotation(annotation)
            
            
           let regionRadius: CLLocationDistance = 250
            
            let CoordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
            mapView.setRegion(CoordinateRegion, animated: true)
            
            print("Latitude: \(latitude), Longitude: \(longitude)")
            
            
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location update failed. \(error)")
    }
    
    func createAnnotation(){
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489", completionHandler: {(placemarks, error) -> Void in
            if ((error) != nil){
                print("Error,error")
            }
            if let placemark = placemarks?.first{
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                
                let longitude = coordinates.longitude
                
                let latitude = coordinates.latitude
                
                
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = "Ngee Ann Polytechnic"
                annotation.subtitle = "School of ICT"
            
                self.mapView.addAnnotation(annotation)
            
            
            let regionRadius: CLLocationDistance = 250
            
            let CoordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            
               self.mapView.setRegion(CoordinateRegion, animated: true)
            
            print("Latitude: \(latitude), Longitude: \(longitude)")
            }
        })
        
    }
    
}

