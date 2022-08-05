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
