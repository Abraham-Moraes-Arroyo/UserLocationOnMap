//
//  ContentView.swift
//  UserLocationOnMap
//
//  Created by Abraham Morales Arroyo on 2/28/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
//    empty array that will store the location of the map markers that are going to be dropped.
    @State private var locationsS = [locations]()
    
    var body: some View {
        MapReader{ proxy in
            Map(position: $position) {
//                below is where we are going to be fetching through the array and be plotting the new points that we have.
                ForEach(locationsS) { location in
                       Marker( location.name, coordinate: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude)
                       )
                }
            }
//            this is to get the coordinates of the user, based on where they tap on. Based on the following link: 
//            https://www.youtube.com/watch?v=9T-xoR7XmUc
            //                    here is where we are going to be storing the dropped markers in to the empty array called locationsS, that has been defined in line 16

            .onTapGesture { location in
                if let coordinate = proxy.convert(location, from: .local ){
                    let newLocation = locations(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locationsS.append(newLocation)
                }
                
            }
            .mapControls {
                MapUserLocationButton()
                MapPitchToggle()
            }
            
              .onAppear(){
                  CLLocationManager().requestWhenInUseAuthorization()
              }
        }
      
    }
}

#Preview {
    ContentView()
}
//to change the locaiton of the map you are going to need the simulator running and once in the simulator got to the features tab and click on location.
