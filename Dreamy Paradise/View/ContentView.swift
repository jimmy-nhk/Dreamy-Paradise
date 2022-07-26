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

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case barList
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            
            BarCategoryHome().tabItem({
                Label("Featured", systemImage: "star")
            }).tag(Tab.featured)
            
            BarList().tabItem({
                Label("List", systemImage: "list.dash")
            }).tag(Tab.barList)

        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
