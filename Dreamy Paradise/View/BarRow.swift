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

struct BarRow: View {
    var bar: Bar

    var body: some View {
        HStack {
            bar.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(bar.name)
            Spacer()
            


        }
    }
}

struct BarRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarRow(bar: bars[0])
            BarRow(bar: bars[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
