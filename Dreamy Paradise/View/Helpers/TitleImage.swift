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

let widthFrame:Double = 440;
let heightFrame:Double = 300;

struct TitleImage: View {
    var image: Image
    
    var body: some View {
        
        // declare image
        image
            .resizable()
            .frame(height: heightFrame)
            .aspectRatio(contentMode: .fit)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        
        TitleImage(image: modelData.bars[0].image).previewLayout(.sizeThatFits)
    }
}
