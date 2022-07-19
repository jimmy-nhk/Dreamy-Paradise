//
//  MapView.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 18/07/2022.
//

import SwiftUI
import MapKit

struct MapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10.766628717141385, longitude: 106.69383848295844),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    
    var body: some View{
        Map(coordinateRegion: $region)
            
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
