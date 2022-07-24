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
import MapKit


struct MapView: View {

    @StateObject private var mapModel = MapModel()
    
    var bar: Bar
    
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 10.766628717141385, longitude: 106.69383848295844),
//        span: MKCoordinateSpan(latitudeDelta:  zoomLevel, longitudeDelta:  zoomLevel)
//        // larger -> zoom out / smaller zoom in
//    )

    
    var body: some View{



        let bars = [bar]
        Text("\(bar.name)").font(.headline)
        
        Map(coordinateRegion: $mapModel.region,showsUserLocation: true,annotationItems: bars){
            MapMarker(coordinate: $0.locationCoordinate, tint: Color(.systemMint))
        }
            .accentColor(Color(.systemRed))
            .onAppear{
                mapModel.checkIfLocationServicesIsEnable()
            }
        




    }
}





struct MapView_Previews: PreviewProvider {
    static var previews: some View {
//        var locationCoordinate =
//            CLLocationCoordinate2D(
//                latitude: 10    ,longitude: 20)
        
        MapView(bar: ModelData().bars[1])
    }
}
