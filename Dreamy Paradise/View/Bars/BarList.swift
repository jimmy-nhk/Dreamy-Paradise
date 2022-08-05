/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Author: Nguyen Hoang Khang
 ID: s3802040
 Created  date:  19/07/2022
 Acknowledgement: Acknowledge the resources that you use here.
 - Apple Developer
 - Tutorial from IOS Development course.
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-a-search-bar-to-filter-your-data
 */

import SwiftUI

enum SortCategory: String, CaseIterable, Identifiable {
    case timeClosedCategory, timeOpenCategory, nameCategory, defaultCategory
    var id: Self { self }
}


struct BarList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavouritesOnly = false
    @State private var selectedSort: SortCategory = .defaultCategory
    @State private var searchValue = ""
    
    var filteredBars: [Bar] {
        modelData.bars.filter{ (bar) in
            if (!showFavouritesOnly || bar.isFavourite ) {
                if searchValue == ""{
                    return true
                }
                if bar.name.contains(searchValue){
                    return true
                }
            }
            return false
        }
    }
    
    var sortedBars: [Bar] {
        
        switch selectedSort {
        case .timeClosedCategory:
            return filteredBars.sorted(by: {(b1: Bar, b2: Bar) -> Bool in
                return b1.timeClosed > b2.timeClosed
            })
        case .timeOpenCategory:
            return filteredBars.sorted(by: {(b1: Bar, b2: Bar) -> Bool in
                return b1.timeOpen < b2.timeOpen
            })
        case .nameCategory:
            return filteredBars.sorted(by: {(b1: Bar, b2: Bar) -> Bool in
                return b1.name < b2.name
            })
        case .defaultCategory:
            return filteredBars
        }
        
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                VStack{
                    Toggle(isOn: $showFavouritesOnly, label: {
                        Text("Favourites only")
                    })
                    
                    Picker("Sort by", selection: $selectedSort) {
                        Text("Default").tag(SortCategory.defaultCategory)
                        Text("Name").tag(SortCategory.nameCategory)
                        Text("Time Opens").tag(SortCategory.timeOpenCategory)
                        Text("Time Closes").tag(SortCategory.timeClosedCategory)
                    }.pickerStyle(.segmented)
                }.padding([.horizontal])
                
                
                
                List {
                    
                    
                    
                    ForEach(sortedBars) {
                        bar in
                        NavigationLink{
                            BarInfo(bar: bar)
                        } label: {
                            BarRow(bar: bar)
                        }
                    }
                }.navigationTitle("Dreamy Places 🥴")
            }
            .searchable(text: $searchValue, prompt: "Find your places")
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            
            
            
        } .listStyle(PlainListStyle())
        
        
        
    }
}

struct BarList_Previews: PreviewProvider {
    static var previews: some View {
        BarList()
            .environmentObject(ModelData())
    }
}
