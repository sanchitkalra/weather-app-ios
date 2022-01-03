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
                            
                            switch weather.weather.first?.id {
                            case 200, 201, 202:
                                Image(systemName: "cloud.bolt.rain")
                                    .font(.system(size: 40))
                            case 210, 211, 212, 221:
                                Image(systemName: "cloud.bolt")
                                    .font(.system(size: 40))
                            case 230, 231, 232:
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            case 300, 301, 302, 321:
                                Image(systemName: "cloud.drizzle")
                                    .font(.system(size: 40))
                            case 310, 311, 312, 313, 314:
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            case 500, 501, 502, 503, 504, 511, 520, 521, 522, 531:
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            case 600, 601, 602:
                                Image(systemName: "cloud.snow")
                                    .font(.system(size: 40))
                            case 611, 612, 613, 615, 616, 620, 621, 622:
                                Image(systemName: "snow")
                                    .font(.system(size: 40))
                            case 711:
                                Image(systemName: "smoke")
                                    .font(.system(size: 40))
                            case 721:
                                Image(systemName: "sun.haze")
                                    .font(.system(size: 40))
                            case 731, 761:
                                Image(systemName: "sun.dust")
                                    .font(.system(size: 40))
                            case 701, 741, 771, 751, 762:
                                Image(systemName: "cloud.fog")
                                    .font(.system(size: 40))
                            case 781:
                                Image(systemName: "tornado")
                                    .font(.system(size: 40))
                            case 800:
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                            case 801, 802, 803, 804:
                                Image(systemName: "cloud")
                                    .font(.system(size: 40))
                            default:
                                Image(systemName: "sun")
                                    .font(.system(size: 40))
                            }
                            
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
