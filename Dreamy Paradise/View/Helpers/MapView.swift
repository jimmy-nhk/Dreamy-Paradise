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

let zoomLevel = 0.0001
struct MapView: View {
    var bar: Bar
    @State private var region = MKCoordinateRegion()

    var body: some View {
            Map(coordinateRegion: $region)
                .onAppear {
                    setRegion(bar.locationCoordinate)
                }.ignoresSafeArea( edges: .top)

    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: zoomLevel, longitudeDelta: zoomLevel)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(bar: ModelData().bars[10])
    }
}




