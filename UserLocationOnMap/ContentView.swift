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
    
    var body: some View {
        Map(position: $position) {
            
            
        }
        .mapControls {
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear(){
            CLLocationManager().requestWhenInUseAuthorization()
        }
        // this part is going to help us add markers as we tap on the map. 
        .onTapGesture { location in
            print("Tapped at \(location)")
            
        }
    }
}

#Preview {
    ContentView()
}
//to change the locaiton of the map you are going to need the simulator running and once in the simulator got to the features tab and click on location.
