//
//  Transformer.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 04/08/22.
//

import Foundation

func dailyWeatherEntityToModel(entity: DailyWeather) -> WeatherModel {
    let date = Date(timeIntervalSince1970: entity.dt)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "eee"
    let dayOfWeek = dateFormatter.string(from: date).uppercased()
    
    let icon = entity.weather[0].icon
    let imageUrl = "https://openweathermap.org/img/wn/\(icon)@2x.png"
    
    let roundedTemperature = Int(entity.main.temp.rounded())
    let temperature = "\(roundedTemperature)°"
    return WeatherModel(dayOfWeek: dayOfWeek, imageUrl: imageUrl, temperature: temperature)
}

func mainWeatherEntityToModelList(entity: WeatherResponseEntity) -> [WeatherModel] {
    let slice = entity.list.map { (dailyWeather) -> WeatherModel in
        dailyWeatherEntityToModel(entity: dailyWeather)
    }.prefix(upTo: 6)
    return Array(slice)
}
