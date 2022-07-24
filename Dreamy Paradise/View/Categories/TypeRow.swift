//
//  CategoryRow.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 24/07/2022.
//

import SwiftUI

struct TypeRow: View {
    var typeName: String
    var items: [Bar]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(typeName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { bar in
                        NavigationLink{
                            BarInfo(bar: bar)
                        } label: {
                            TypeItem(bar: bar)
                        }
                    }
                })
            }
            .frame(height: 185)
            
        }
    }
}

struct TypeRow_Previews: PreviewProvider {
    static var bars = ModelData().bars

    static var previews: some View {
        TypeRow(
            typeName: bars[0].type.rawValue, items: Array(bars.prefix(5))
        )
    }
}
