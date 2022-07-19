//
//  CircleImage.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 18/07/2022.
//

import SwiftUI

let widthFrame:Double = 440;
let heightFrame:Double = 400;

struct CircleImage: View {
    var body: some View {


        Image("The Locus")
            .resizable()
            .clipShape(Rectangle())
            .cornerRadius(40)
//                .scaledToFit()
//                .aspectRatio(contentMode: .fill)
            .frame(width: widthFrame , height: heightFrame)

    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
