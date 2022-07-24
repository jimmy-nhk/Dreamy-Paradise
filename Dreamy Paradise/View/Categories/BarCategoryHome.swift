//
//  BarCategory.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 24/07/2022.
//

import SwiftUI

struct BarCategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView{
            List {
                
                modelData.features[1].image
                    .resizable()
                    .scaledToFit()
                    .frame( height: 300)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.types.keys.sorted(), id: \.self) { key in
                    TypeRow(typeName: key, items: modelData.types[key]!)
                }
                .listRowInsets(EdgeInsets())

            }
            .navigationTitle("Featured")
        }
    }
}

struct BarCategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        BarCategoryHome()
            .environmentObject(ModelData())
    }
}
