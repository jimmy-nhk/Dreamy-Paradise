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

struct BarCategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
    // use navigation view to navigate
        NavigationView{
            List {
                // page view component
                PageView(pages: ModelData().featuredImageTypeDict.map { FeatureCard(imageFeature: $0.image, typeName: $0.typeName) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                // each type
                ForEach(modelData.types.keys.sorted(), id: \.self) { key in
                    TypeRow(typeName: key, items: modelData.types[key]!)
                        .listRowInsets(EdgeInsets())
                }
                .listRowInsets(EdgeInsets())
                
            }.navigationTitle("Featured")
                .listStyle(PlainListStyle())
        }
        
    }
}

struct BarCategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        BarCategoryHome()
            .environmentObject(ModelData())
    }
}
