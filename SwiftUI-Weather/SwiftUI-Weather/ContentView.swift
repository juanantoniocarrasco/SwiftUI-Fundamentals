//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Juan Antonio Carrasco del Cid on 22/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherView(dayOfWeek: "TUE",
                                imageName: "cloud.sun.fill",
                                temperature: 74)
                    WeatherView(dayOfWeek: "WED",
                                imageName: "sun.max.fill",
                                temperature: 88)
                    WeatherView(dayOfWeek: "THU",
                                imageName: "wind.snow",
                                temperature: 55)
                    WeatherView(dayOfWeek: "FRI",
                                imageName: "sunset.fill",
                                temperature: 60)
                    WeatherView(dayOfWeek: "SAT",
                                imageName: "snow",
                                temperature: 25)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .medium, design: .default))
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)")
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .semibold))
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,
                          weight: .medium,
                          design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,
                       height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 70,
                              weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
