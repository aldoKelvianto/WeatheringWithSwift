//
//  DailyWeather.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 04/08/22.
//

struct DailyWeather: Codable {
    var dt: Double
    var main: MainWeatherEntity
    var weather: [WeatherEntity]
    var visibility: Int
    var dt_txt: String
}
