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

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        
        
        image
            .resizable()
            .frame(width: .infinity)
            .frame(height: heightFrame)
//            .clipShape( RoundedCorner(radius: 10, corners: [.bottomLeft, .bottomRight]) )
//            .shadow(color: .gray, radius: 10)
            .aspectRatio(contentMode: .fit)
//                        .scaledToFit()
        //                .aspectRatio(contentMode: .fill)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        
        CircleImage(image: modelData.bars[0].image).previewLayout(.sizeThatFits)
    }
}
