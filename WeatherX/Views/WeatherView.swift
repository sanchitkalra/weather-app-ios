//
//  WeatherView.swift
//  WeatherX
//
//  Created by Sanchit Kalra on 03/01/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 85))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
//                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1589350033409-35701c4273d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2908&q=80")) {image in
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 350)
//                    } placeholder: {
//                        ProgressView()
//                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.temp_min.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.temp_max.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.639, saturation: 0.768, brightness: 0.32))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .background(Color(hue: 0.639, saturation: 0.768, brightness: 0.32))
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
