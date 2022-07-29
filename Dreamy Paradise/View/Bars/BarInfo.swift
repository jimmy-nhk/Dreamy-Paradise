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
                    
                    // VStack
                    VStack(alignment:.leading) {
                        
                      // Title
                        HStack {
                            Text(bar.name)
                                .font(.title)
                            
                            FavoriteButton(isSet: $modelData.bars[barIndex].isFavourite)
                        }
                        
                        // Address and type
                        GeometryReader {metric in
                            HStack {
                                Text("\(bar.address)")
                                    .font(.subheadline)
                                    .frame(width: metric.size.width * 0.6,height: metric.size.height * 1.5, alignment: .leading)
                                    .lineLimit(4)
                                    
                                Spacer()
                                    .frame(width: metric.size.width * 0.2)

                                Text(bar.type.rawValue)
                                    .font(.subheadline)
                                    .frame(width: metric.size.width * 0.2, alignment: .trailing)
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }.frame( height: 40)
                            .padding([.bottom], 20)

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
                        NavigationLink(destination:   MapView(bar: bar)
                                       , label: {
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
