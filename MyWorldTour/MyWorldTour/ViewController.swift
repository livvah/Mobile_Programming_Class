//
//  ViewController.swift
//  MyWorldTour
//
//  Created by COSC3326 on 3/8/17.
//  Copyright © 2017 COSC3326. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation



class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    
    @IBOutlet weak var myMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
    
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    
        let benson = MKPointAnnotation()
        benson.coordinate = CLLocationCoordinate2DMake(45.521790, -122.678808)
            benson.title = "Benson Hotel"
            paris.subtitle = "Accomodation"
        
        
        let locations = [benson]
        
            myMap.addAnnotations(locations)
        
    
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        
        
        locationManager.stopUpdatingLocation()
        
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 1000, 1000)
        
        myMap.setRegion(region, animated: true)
    }
    
}

