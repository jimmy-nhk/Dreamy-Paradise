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
    var isFavourite: Bool
    
    var image: Image{
        Image(imageName)
    }
    
    
    
    var latitudeConverted: Double{
        return(LatLongConvert(stringNeedConvert: latitude, index: 2))
    }
    
    var longitudeConverted: Double{
        return(LatLongConvert(stringNeedConvert: longitude, index: 3))
    }
    
    func LatLongConvert(stringNeedConvert: String, index: Int) -> Double {
        let dotChar: Character = "."
        
        let latArr = latitude.components(separatedBy: ".")

        var joinedLat = latArr.joined(separator: "")
        let i = joinedLat.index(joinedLat.startIndex, offsetBy: index)
        joinedLat.insert(dotChar, at: i)
        let result = Double(joinedLat)
        
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
