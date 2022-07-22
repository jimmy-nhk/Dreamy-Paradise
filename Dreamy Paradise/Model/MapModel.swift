//
//  MapModel.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 22/07/2022.
//

import Foundation
import MapKit

let zoomLevel = 0.001

enum MapDetails {
    static let rmitCoordinates = CLLocationCoordinate2D(latitude: 10.731418287635757, longitude: 106.6931226505876)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta:  zoomLevel, longitudeDelta:  zoomLevel)
}

final class MapModel: NSObject, CLLocationManagerDelegate, ObservableObject{
    
    var locationManager : CLLocationManager? // make sure the location service is enabled
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10.766628717141385, longitude: 106.69383848295844),
        span: MapDetails.defaultSpan
        // larger -> zoom out / smaller zoom in
    )
    func checkIfLocationServicesIsEnable(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        }else{
            print("Show an alert lettign them know it is off")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, //center: MapDetails.rmitCoordinates,
                                        span: MapDetails.defaultSpan)
        @unknown default:
            break
        }

    }
    
//    Constantly check for the location permission
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
