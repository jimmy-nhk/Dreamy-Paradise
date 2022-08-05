/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Nguyen Hoang Khang
 ID: s3802040
 Created  date:  18/07/2022
 Acknowledgement: Acknowledge the resources that you use here.
 - Apple Developer
 - Tutorial from IOS Development course.
 */

import Foundation
import SwiftUI
import CoreLocation

struct Bar: Hashable, Codable, Identifiable{
    
    // declare variables
    var id : Int
    var name: String
    var description: String
    var address: String
    var timeOpen: String
    var timeClosed: String
    var latitude: String
    var longitude: String
    var web: String
    var imageName: String
    var isFavourite: Bool
    var isFeatured: Bool
    
    // declare category
    var type: Category
    enum Category: String, CaseIterable, Codable {
        case bar = "Bar"
        case barChill = "Bar Chill"
        case skyBar = "Sky Bar"
        case lounge = "Lounge"
    }
    
    var image: Image{
        Image(imageName)
    }
    
    var latitudeConverted: Double{
        return(LatLongConvert(stringNeedConvert: latitude))
    }
    
    var longitudeConverted: Double{
        return(LatLongConvert(stringNeedConvert: longitude))
    }
    
    // convert to doulbe
    func LatLongConvert(stringNeedConvert: String) -> Double {
        let result = Double(stringNeedConvert)
        if  result != nil {
            return result ?? 0.0
        }else{
            return 0.0
        }
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitudeConverted,longitude: longitudeConverted)
    }
    
    
    
}
