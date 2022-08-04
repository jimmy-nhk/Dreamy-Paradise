//
//  FavoriteButton.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 24/07/2022.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button{
            isSet.toggle()
            modelData.saveToFile()
        }label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
