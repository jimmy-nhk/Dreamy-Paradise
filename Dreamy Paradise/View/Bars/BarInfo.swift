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

struct BarInfo: View {
    @EnvironmentObject var modelData: ModelData
    var bar: Bar
    
    var barIndex: Int {
        modelData.bars.firstIndex(where: {barModel in barModel.id == self.bar.id})!
    }
    
    var body: some View {
        ScrollView{
            
            VStack {
                
                // Title Image
                TitleImage(image: bar.image)
                
                // VStack
                VStack(alignment: .leading){
                    
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

                        let url = "\(bar.web)"
                        let link = "[Know Your Bar More](\(url))"
                        Text(.init(link))
                        
                        Spacer()
                        
                        Text("\(bar.timeOpen) - \(bar.timeClosed)")
                            .font(.subheadline)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    
                    // Divider distinguish the title and detailed description
                    Divider().frame(height: 10)
                    
                    // Description
                    Text("Description")
                        .font(.title2)
                    
                    Text("\(bar.description)")
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    
                    
                    HStack{
                        Spacer()
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
                        .padding(.top, 20)
                        Spacer()
                        
                    }
                    
                }
                .padding(15.0)
                Spacer()
            }
            
        }.ignoresSafeArea( edges: .top)
    }
    
}

struct BarInfo_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        
        Group {
            BarInfo(bar: modelData.bars[0])
                .environmentObject(modelData)
        }
    }
}
