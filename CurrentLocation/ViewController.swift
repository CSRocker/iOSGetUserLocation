//
//  ViewController.swift
//  CurrentLocation
//
//  Created by Clara Chen on 9/24/16.
//  Copyright © 2016 Clara Chen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var latitude: UILabel!
    
    @IBOutlet weak var longitude: UILabel!
    
    
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var horizontalAccuracy: UILabel!
    
    @IBOutlet weak var verticalAccuracy: UILabel!
    
    
    @IBOutlet weak var distance: UILabel!
    
    var locationManager = CLLocationManager()
    
    var startLocation:CLLocation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //initialize locationManager
        self.locationManager = CLLocationManager.init()
        
        // set desired accuracy
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        // set distance filter in meters
        self.locationManager.distanceFilter = 500
        
        // set location manager delegate to self
        self.locationManager.delegate = self
        
    
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        startLocation = nil
        
        print("Done Loading...")
        

        
    }

    @IBAction func resetDistance(_ sender: UIButton) {
        startLocation = nil
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations.last!
        let currentLatitude = NSString(format: "%+.6f", userLocation.coordinate.latitude)
        latitude.text = currentLatitude as String
        let currentLongitude = NSString(format: "%+.6f", userLocation.coordinate.longitude)
        longitude.text = currentLongitude as String
        
        if(startLocation == nil){
            startLocation = userLocation
        }
        print("Current Latitude \(currentLatitude)")
    }

}

