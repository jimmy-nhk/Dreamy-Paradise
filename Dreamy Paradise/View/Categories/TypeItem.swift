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

struct TypeItem: View {
    var bar: Bar
    
    var body: some View {
        
        // declare vstack
        VStack(alignment: .leading) {
            // image
            bar.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            // text
            Text(bar.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct TypeItem_Previews: PreviewProvider {
    static var previews: some View {
        TypeItem(bar: ModelData().bars[0])
    }
}
