//
//  ContentView.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 18/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {

            CircleImage()
                .ignoresSafeArea( edges: .top)

            
            VStack(alignment:.leading) {
                Text("Name")
                    .font(.title)

                HStack {
                    Text("Address")
                        .font(.subheadline)
                    Spacer()
                    Text("Type of bar")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding([.top, .bottom], 1)
                
                HStack {
                    Text("www.thelocus.com.vn")
                        .font(.subheadline)
                    Spacer()
                    Text("18:00 - 24:00")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
//                Divider distinguish the title and detailed description
                Divider().frame(width: 400, height: 10)

                
                Text("Description")
                    .font(.title2)
                
                Text("Descriptive text goes hereDescriptive text goes hereDescriptive text goes hereDescriptive text goes scriptive text goes hereDescriptive text goes here \n ereDescripive text goes hereDescriptive text goes here \n  ")
                    .padding(.top, 10)
                
                Spacer()
                
                Button(action: {
                    
                },label: {
                    Text("Map -> Replace with Icon".uppercased())
                                .fontWeight(.bold)
                                .frame(width: 300, height:50 , alignment: .center)

                })
                    .buttonStyle(.borderedProminent)
                    .accentColor(.black)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .frame(width: 400, height:50 , alignment: .center)
            }
            .padding(15.0)
            .offset(y: -40)
            
//            MapView()
//                .ignoresSafeArea( edges: .top)
//                .frame(height: 300, alignment: .center)
            

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
