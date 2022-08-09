//
//  MainWeatherStatusView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 01/08/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HighlightWeatherStatusView: View {
    
    var isNight: Bool
    var weatherModel: WeatherModel
    
    var body: some View {
        VStack(spacing: 8) {
            if (weatherModel.temperature != "...") {
                WebImage(url: URL(string: weatherModel.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180, alignment: .center)
            }
            
            Text("\(weatherModel.temperature)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .medium))
        }.padding(.bottom, 40)
    }
}

struct MainWeatherStatusView_Previews: PreviewProvider {
    static var previews: some View {
        let modelDay = WeatherModel(dayOfWeek: "", imageUrl: "http://openweathermap.org/img/wn/01d@2x.png", temperature: "30")
        let modelNight = WeatherModel(dayOfWeek: "", imageUrl: "http://openweathermap.org/img/wn/01n@2x.png", temperature: "20")
        
        HighlightWeatherStatusView(isNight: true, weatherModel: modelNight)
            .padding()
            .background(.black)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Night mode")
        
        HighlightWeatherStatusView(isNight: false, weatherModel: modelDay)
            .padding()
            .background(.blue)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Day mode")
    }
}
