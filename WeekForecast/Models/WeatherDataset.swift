//
//  WeatherDataset.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import Foundation

struct WeatherDataset: Hashable, Codable {
    var current: CurrentWeather?
    var forecast: Forecast?
}

struct CurrentWeather: Hashable, Codable {
    var temp: Double? //
    var conditions: Condition?
    var windspeed: Double? //
    var windDirection: String? //
    var humidity: Double?
    var feelsLikeTemp: Double?
    var uv: Double?
}

struct Condition: Hashable, Codable {
    var text: String?
    var icon: String?
}

struct Forecast: Hashable, Codable {
    var forecastday: [ForecastDay]?
}

struct ForecastDay: Hashable, Codable {
    var date: String?
    var day: Day?
}

struct Day: Hashable, Codable {
    var highTemp: Double?
    var lowTemp: Double?
    var maxWindSpeed: Double?
    var condition: Condition?
}
