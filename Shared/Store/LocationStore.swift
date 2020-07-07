//
//  LocationStore.swift
//  iOS
//
//  Created by Romulo Messias on 06/07/20.
//

import Foundation
import MapKit

class LocationStore: NSObject, ObservableObject {
    private let locationManager: CLLocationManager = CLLocationManager()
    @Published var currentCity: String? = nil
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


extension LocationStore: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let geocoder = CLGeocoder()
        
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("*** Error in \(#function): placemark is nil")
                return
            }
            
            print(placemark.locality)
            DispatchQueue.main.async {
                self.currentCity =  placemark.locality
            }
            
        }
        
    }
}
