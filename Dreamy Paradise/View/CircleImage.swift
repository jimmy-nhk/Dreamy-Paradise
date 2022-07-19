//
//  CircleImage.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 18/07/2022.
//

import SwiftUI

let widthFrame:Double = 440;
let heightFrame:Double = 410;

struct CircleImage: View {
    var image: Image
    
    var body: some View {


        image
            .resizable()
            .clipShape(Rectangle())
            .cornerRadius(40)
            .shadow(color: .gray, radius: 10)
//                .scaledToFit()
//                .aspectRatio(contentMode: .fill)
            .frame(width: widthFrame , height: heightFrame)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        let barModel: Bar = Bar(id: 0, name: "The Locus", description: "Descriptive text goes hereDescriptive text goes hereDescriptive text goes hereDescriptive text goes scriptive text goes hereDescriptive text goes here \n ereDescripive text goes hereDescriptive text goes here ",address: "Address", type: "Bar Chill", timeOpen: "18:00", timeClosed: "24:00", latitude: "Latitude", longitude: "Longitude", web: "www.thelocus.com.vn", imageName: "The Locus")
        CircleImage(image: barModel.image).previewLayout(.sizeThatFits)
    }
}
