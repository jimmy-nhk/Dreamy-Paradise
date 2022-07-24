//
//  TypeItem.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 24/07/2022.
//

import SwiftUI

struct TypeItem: View {
    var bar: Bar
    
    var body: some View {
        VStack(alignment: .leading) {
            bar.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
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
