//
//  WeatherResponseEntity.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 04/08/22.
//

struct WeatherResponseEntity: Codable {
    var cod: String
    var cnt: Int
    var list: [DailyWeather]
    var city: CityEntity
}
