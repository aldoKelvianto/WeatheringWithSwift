//
//  ContentView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 07/07/22.
//

import SwiftUI
import CoreLocationUI

struct MainWeatherContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: viewModel.isNight)
            
            VStack {
                Spacer()
                CityTextView(cityName: viewModel.cityName)
                
                HighlightWeatherStatusView(isNight: viewModel.isNight, weatherModel: viewModel.weatherModelList.first!)
                
                HStack(spacing: 20) {
                    WeatherDayView(weatherModel: viewModel.weatherModelList[1])
                    WeatherDayView(weatherModel: viewModel.weatherModelList[2])
                    WeatherDayView(weatherModel: viewModel.weatherModelList[3])
                    WeatherDayView(weatherModel: viewModel.weatherModelList[4])
                    WeatherDayView(weatherModel: viewModel.weatherModelList[5])
                }
                
                Spacer()
                
                Button {
                    if let link = URL(string: "https://darksky.net/forecast/\(viewModel.coordinate.lat),\(viewModel.coordinate.lon)/si12/en") {
                        UIApplication.shared.open(link)
                    }
                } label: {
                    WeatherButtonView(
                        title: "Open Weather Detail",
                        backgroundColor: .white,
                        textColor: .blue
                    )
                }
                
                Spacer()
            }
        }.onAppear() {
            viewModel.checkWhetherItsDayOrNight()
            viewModel.requestLocationUpdates()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("Dark mode")
    }
}
