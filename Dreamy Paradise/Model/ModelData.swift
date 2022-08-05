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
import MapKit

var fileName = "Bar_IOS_final"

final class ModelData: ObservableObject {
    
    @Published var bars: [Bar] = load(fileName + ".json")
    
    // define unique types
    var types: [String: [Bar]] {
        Dictionary(
            grouping: bars, by: {$0.type.rawValue}
        )
    }
    
    // take feature image for type bar
    var featuredImageTypeDict: [FeatureObject] {
        
        let arrayBarTypes = types.keys
        var arrayImage: [FeatureObject] = []
        
        for barType in (arrayBarTypes) {
            let featureObject = FeatureObject(imageType: barType + " Feature", typeName: barType, typeDescription: barType)
            arrayImage.append(featureObject)
        }
        
        return arrayImage
    }
}

// declare feature object
struct FeatureObject {
    
    var imageType: String
    var typeName: String
    var typeDescription: String
    
    var image: Image{
        Image(imageType)
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
