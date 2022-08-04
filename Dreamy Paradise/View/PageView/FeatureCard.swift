//
//  FeatureCard.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 26/07/2022.
//

import SwiftUI

struct FeatureCard: View {
    
    var imageFeature: Image
    var typeName: String
    
    var body: some View {
        
        imageFeature
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(typeName: typeName)
            }
        
    }
}

struct TextOverlay: View {
    var typeName: String
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(typeName)
                    .font(.title)
                    .bold()
                Text(typeName)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(imageFeature: Image("Bar Chill Feature"), typeName: "Bar Chill" )
    }
}
