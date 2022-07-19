/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of bars.
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
