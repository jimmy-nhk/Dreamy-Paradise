//
//  TestFunction.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 22/07/2022.
//

import SwiftUI
import MapKit

struct TestFunction: View {
    var bar: Bar
    
    @State private var directions: [String] = []
    @State private var showDirections = false
    
    var body: some View {
        VStack {
            MapView1(directions: $directions)
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show directions")
            })
            .disabled(directions.isEmpty)
            .padding()
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color(UIColor.systemBlue))
                
                List(0..<self.directions.count, id: \.self) { i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
    
    //    var body: some View {
    //
    //        VStack{
    //            MapView1()
    //
    //            Button(action: {}, label: {
    //                Text("Show Directions")
    //            })
    //        }
    
    
    
    
    // Button in BarInfo
    //        NavigationView {
    //            VStack {
    //                NavigationLink(destination:  MapView(bar: bar), label: {
    //
    //                    HStack{
    //                        Image(systemName: "map.fill")
    //                            .foregroundStyle(.white)
    //
    //                        Text("Mapping".uppercased())
    //                            .fontWeight(.bold)
    //
    //                    }
    //                    .frame(width: 300, height:50 , alignment: .center)
    //                    .buttonStyle(.borderedProminent)
    //                    .accentColor(.black)
    //                    .buttonBorderShape(.roundedRectangle(radius: 20))
    //                    .ignoresSafeArea( edges: .bottom)
    //                    .background(.red)
    //
    //                })
    //            }
    //        }
    
    
    
    
    
    //    }
}

struct TestFunction_Previews: PreviewProvider {
    static var bars = ModelData().bars

    static var previews: some View {
        
        Group {
            //            TestFunction(bar: bars[0])
            TestFunction(bar: bars[1])
            TestFunction(bar: bars[3])
            TestFunction(bar: bars[4])
        }
    }
}

struct MapView1: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 10.766628717141385, longitude: 106.69383848295844),
            span: MapDetails.defaultSpan
            // larger -> zoom out / smaller zoom in
        )
        mapView.setRegion(region, animated: true)
        
        
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 10.766628717141385, longitude: 106.69383848295844))
        let p2 = MKPlacemark(coordinate: MapDetails.rmitCoordinates)
        
        
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate{response, error in
            guard let route = response?.routes.first else {return}
            mapView.addAnnotations([p1,p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) ,animated: true)
        }
        
        return mapView
        
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, renderedFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 4
            return renderer
        }
    }
}
