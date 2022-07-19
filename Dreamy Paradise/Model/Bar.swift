//
//  Bar.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 18/07/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Bar: Hashable, Codable, Identifiable{
    
//    var id = UUID()
    var id : Int
    var name: String
    var description: String
    var address: String
    var type: String
    var timeOpen: String
    var timeClosed: String
    var latitude: String
    var longitude: String
    var web: String
    var imageName: String
    
    var image: Image{
        Image(imageName)
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(latitude)!,longitude: Double(longitude)!)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
    

}
