/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Nguyen Hoang Khang
  ID: s3802040
  Created  date:  19/07/2022
  Acknowledgement: Acknowledge the resources that you use here.
 - Apple Developer
 - Tutorial from IOS Development course.
*/

import SwiftUI

struct BarList: View {
    var body: some View {

        NavigationView{
            List (bars, id: \.self.id){ bar in
                NavigationLink{
                    BarInfo(bar: bar)
                } label: {
                    BarRow(bar: bar)
                }.navigationTitle("Dreamy Places 🥴")
            }
        }

    }
}

struct BarList_Previews: PreviewProvider {
    static var previews: some View {
        BarList()
    }
}
