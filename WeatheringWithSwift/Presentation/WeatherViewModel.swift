//
//  WeatherViewModel.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 01/08/22.
//

import Foundation
import Alamofire
import CoreLocation
import Combine

extension MainWeatherContentView {
    class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        
        private var apiKey: String {
            get {
                guard let infoDictionary = Bundle.main.infoDictionary else {
                    return ""
                }
                guard let key = infoDictionary["KeyWeatherApiKey"] as? String else {
                    return ""
                }
                return key
            }
        }
        
        @Published private(set) var isNight: Bool = false
        
        @Published private(set) var weatherModelList: [WeatherModel] = [
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "..."),
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "..."),
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "..."),
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "..."),
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "..."),
            WeatherModel(dayOfWeek: "...", imageUrl: "", temperature: "...")
        ]
        @Published private(set) var cityName: String = "Loading.."
        
        @Published private(set) var coordinate = (lat: 0.0, lon: 0.0)
        
        private lazy var locationManager : CLLocationManager = {
            let manager = CLLocationManager()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.delegate = self
            return manager
        }()
        
        override init() {
            super.init()
        }
        
        func checkWhetherItsDayOrNight() {
            let date = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            print("Hour \(hour)")
            if (hour > 6 && hour < 18) {
                isNight = false
            } else {
                isNight = true
            }
        }
        
        private func callWeatherApi(latitude: Double, longitude: Double) {
            let api = "https://api.openweathermap.org/data/2.5/forecast?units=metric&lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
            AF.request(api).responseDecodable(of: WeatherResponseEntity.self) { (response) in
                guard let entity = response.value else { return }
                let model = mainWeatherEntityToModelList(entity: entity)
                self.weatherModelList = model
                self.cityName = entity.city.name
            }
        }
        
        func requestLocationUpdates() {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                locationManager.startUpdatingLocation()
            default:
                debugPrint("locationManagerDidChangeAuthorization: permission denied")
            }
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedWhenInUse, .authorizedAlways:
                manager.startUpdatingLocation()
                
            default:
                manager.stopUpdatingLocation()
                debugPrint("locationManagerDidChangeAuthorization: permission denied")
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let latestCoordinate = locations.first?.coordinate else {
                debugPrint("didUpdateLocations: nil coordinate")
                return
            }
            coordinate = (latestCoordinate.latitude, latestCoordinate.longitude)
            callWeatherApi(latitude: latestCoordinate.latitude, longitude: latestCoordinate.longitude)
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            debugPrint("didFailWithError: \(error.localizedDescription)")
        }
    }
}
