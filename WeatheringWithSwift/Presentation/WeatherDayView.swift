//
//  WeatherDayView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 01/08/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct WeatherDayView: View {

    var weatherModel: WeatherModel
    
    var body: some View {
        VStack {
            Text(weatherModel.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            if (weatherModel.temperature != "...") {
                WebImage(url: URL(string: weatherModel.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
            }
            Text("\(weatherModel.temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        let modelDay = WeatherModel(dayOfWeek: "", imageUrl: "http://openweathermap.org/img/wn/01d@2x.png", temperature: "30")
        let modelNight = WeatherModel(dayOfWeek: "", imageUrl: "http://openweathermap.org/img/wn/01n@2x.png", temperature: "20")
        
        WeatherDayView(weatherModel: modelDay)
            .padding()
            .background(.white)
            .previewLayout(.sizeThatFits)
            
        WeatherDayView(weatherModel: modelNight)
            .padding()
            .background(.black)
            .previewLayout(.sizeThatFits)
    }
}
