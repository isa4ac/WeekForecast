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
    
    func getTemp(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.0f", convertToCelsius(temp ?? 0.0)) + "°" + "C"
        }
        return String(format: "%.0f", temp ?? 0.0) + "°" + "F"
    }
    
    func getFeelsLike(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.0f", convertToCelsius(feelsLikeTemp ?? 0.0)) + "°" + "C"
        }
        return String(format: "%.0f", feelsLikeTemp ?? 0.0) + "°" + "F"
    }
    
    func getConditionIcon() -> String {
        if let iconLink = conditions?.icon {
            return "https:" + iconLink
        }
        return ""
    }
    
    func getWindSpeed(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.1f", convertToKmph(windspeed ?? 0.0)) + "kmph"
        }
        return String(format: "%.1f", windspeed ?? 0.0) + "mph"
    }
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
    
    func getFormattedDateString() -> String {
        let formatGet = DateFormatter()
        formatGet.dateFormat = "yyyy-MM-dd"
        
        let formatPost = DateFormatter()
        formatPost.dateFormat = "E, d MMM"
        
        if let dateVal = formatGet.date(from: date ?? "") {
            return formatPost.string(from: dateVal)
        }
        return ""
    }
}

struct Day: Hashable, Codable {
    var highTemp: Double?
    var lowTemp: Double?
    var maxWindSpeed: Double?
    var condition: Condition?
    
    func getHighTemp(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.0f", convertToCelsius(highTemp ?? 0.0)) + "°" + "C"
        }
        return String(format: "%.0f", highTemp ?? 0.0) + "°" + "F"
    }
    
    func getLowTemp(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.0f", convertToCelsius(lowTemp ?? 0.0)) + "°" + "C"
        }
        return String(format: "%.0f", highTemp ?? 0.0) + "°" + "F"
    }
    
    func getConditionIcon() -> String {
        if let iconLink = condition?.icon {
            return "https:" + iconLink
        }
        return ""
    }
    
    func getWindSpeed(_ location: String) -> String {
        if location == "London" {
            return String(format: "%.1f", convertToKmph(maxWindSpeed ?? 0.0)) + "kmph"
        }
        return String(format: "%.1f", maxWindSpeed ?? 0.0) + "mph"
    }
}

func convertToCelsius(_ fTemp: Double) -> Double {
    (fTemp - 32.0) * (5/9)
}

func convertToKmph(_ mph: Double) -> Double {
    mph * 1.60934
}
