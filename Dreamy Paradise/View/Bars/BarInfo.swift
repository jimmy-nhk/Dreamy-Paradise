//
//  BarInfo.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 19/07/2022.
//

import SwiftUI

struct BarInfo: View {
    @EnvironmentObject var modelData: ModelData
    var bar: Bar
    
    var barIndex: Int {
        modelData.bars.firstIndex(where: {barModel in barModel.id == self.bar.id})!
    }
    
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.bottom)
        ScrollView{
                
                VStack {
                    
                    
                    CircleImage(image: bar.image)
                        .offset(y: -20)
                    
                    // VStack
                    VStack(alignment:.leading) {
                        
                      // Title
                        HStack {
                            Text(bar.name)
                                .font(.title)
                            
                            FavoriteButton(isSet: $modelData.bars[barIndex].isFavourite)
                        }
                        
                        // Address and type
                        HStack {
                            Text("\(bar.address)")
                                .font(.subheadline)
                            Spacer()
                            Text(bar.type)
                                .font(.subheadline)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding([.top, .bottom], 1)
                        
                        // web and time
                        HStack {
                            Text("\(bar.web)")
                                .font(.subheadline)
                            Spacer()
                            Text("\(bar.timeOpen) - \(bar.timeClosed)")
                                .font(.subheadline)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        
                        //                Divider distinguish the title and detailed description
                        Divider().frame(width: 400, height: 10)
                        
                        
                        Text("Description")
                            .font(.title2)
                        
                        Text("\(bar.description)")
                            .padding(.top, 10)
                            .padding(.bottom, 20)
                        
                        
                        // Navigation Link
                        NavigationLink(destination:  MapView(bar: bar), label: {
                            ZStack{
                                Color(.black)
                                HStack{
                                    Image(systemName: "map.fill")
                                        .foregroundStyle(.white)
                                    
                                    Text("Mapping".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }.frame(width: 300, height:50 , alignment: .center)
                            }.cornerRadius(18)
                                .frame(width: 200, height:60 )
                            
                            
                            
                        })
                        .buttonBorderShape(.roundedRectangle(radius: 20))
                        .frame(width: 400, height:50 , alignment: .center)                .ignoresSafeArea( edges: .bottom)
                        .padding(.top, 20)
                        
                        
                        
                        
                        
                    }
                    .padding(15.0)
                    .offset(y: -20)
                    .ignoresSafeArea( edges: .bottom)
                    
                    
                    
                    
                    Spacer()
                }
            }
        }
    }
    
}

struct BarInfo_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        
        
        Group {
            BarInfo(bar: modelData.bars[0])
                .environmentObject(modelData)
            
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        
    }
}
