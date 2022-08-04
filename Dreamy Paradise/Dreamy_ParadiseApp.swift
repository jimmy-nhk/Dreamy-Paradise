//
//  Dreamy_ParadiseApp.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 19/07/2022.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct Dreamy_ParadiseApp: App {
    
//    StateObject is used to initialize a model object for a given property only once during the life time of the app (Dreamy Paradise App in the case).
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
