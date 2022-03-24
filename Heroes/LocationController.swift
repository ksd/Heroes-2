//
//  LocationController.swift
//  Heroes
//
//  Created by ksd on 17/03/2022.
//

import Foundation
import MapKit

final class LocationController: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    @Published var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 56.1190901, longitude: 10.14765),
        latitudinalMeters: 500,
        longitudinalMeters: 500)
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            // Bestemmer opløsningen på dit koordinat
            // locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }

        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("et eller andet")
        case .denied:
            print("NÅ! - nu er jeg sur")
        case .authorizedAlways, .authorizedWhenInUse:
            coordinateRegion.center = locationManager.location!.coordinate
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        coordinateRegion.center = locations.first!.coordinate
        print("\(locations.first!.coordinate)")
    }
        
}


