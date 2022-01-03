//
//  ContentView.swift
//  WeatherX
//
//  Created by Sanchit Kalra on 03/01/22.
//

import SwiftUI

struct ContentView: View {
     
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Current coordinates are \(location.latitude) and \(location.longitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.639, saturation: 0.768, brightness: 0.32))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
