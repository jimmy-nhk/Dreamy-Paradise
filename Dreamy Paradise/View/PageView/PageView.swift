//
//  PageView.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 26/07/2022.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().featuredImageTypeDict.map { FeatureCard(imageFeature: $0.image, typeName: $0.typeName) })
            .aspectRatio(3 / 2, contentMode: .fit)
        
    }
    
}
