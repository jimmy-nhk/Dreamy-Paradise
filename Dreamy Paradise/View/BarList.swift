//
//  BarList.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 19/07/2022.
//

import SwiftUI

struct BarList: View {
    var body: some View {

        NavigationView{
            List (bars, id: \.self.id){ bar in
                NavigationLink{
                    BarInfo(bar: bar)
                } label: {
                    BarRow(bar: bar)
                }.navigationTitle("Dreamy Places")
            }
        }

    }
}

struct BarList_Previews: PreviewProvider {
    static var previews: some View {
        BarList()
    }
}
