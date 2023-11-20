//
//  MainContentView+ViewModel.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import Foundation

extension MainContentView {
    class ViewModel: ObservableObject {
        @Published var locationSelection = "Cincinnati"
        @Published var selectedLocationWeather = WeatherDataset()
        
        func formatDateString(_ date: String) -> String {
            let formatGet = DateFormatter()
            formatGet.dateFormat = "yyyy-MM-dd"
            
            let formatPost = DateFormatter()
            formatPost.dateFormat = "E, d MMM"
            
            if let dateVal = formatGet.date(from: date) {
                return formatPost.string(from: dateVal)
            }
            return ""
        }
        
        func getDayTemp(_ day: Day) -> String {
            if locationSelection == "London" {
                return String(format: "%.0f", convertToCelsius(day.highTemp ?? 0.0)) + "°" + "C"
            }
            return String(format: "%.0f", day.highTemp ?? 0.0) + "°" + "F"
        }
        
        func getCurrentIcon() -> String {
            if let iconLink = selectedLocationWeather.current?.conditions?.icon {
                return "https:" + iconLink
            }
            return ""
        }
        
        func getCurrentTemp() -> Double {
            if locationSelection == "London" {
                return convertToCelsius(selectedLocationWeather.current?.temp ?? 0.0)
            }
            return selectedLocationWeather.current?.temp ?? 0.0
        }
        
        func convertToCelsius(_ fTemp: Double) -> Double {
            (fTemp - 32.0) * (5/9)
        }
        
        func getForecastDays() -> [ForecastDay] {
            if let forecast = selectedLocationWeather.forecast, let days = forecast.forecastday {
                return days
            }
            return [ForecastDay]()
        }
        
        func getDayCondition(_ day: ForecastDay) -> Condition {
            if let condition = day.day?.condition {
                return condition
            }
            return Condition()
        }
        
        func getDayConditionText(_ day: ForecastDay) -> String {
            getDayCondition(day).text ?? ""
        }
        
        func getDayConditionIcon(_ day: ForecastDay) -> String {
            if let iconLink = getDayCondition(day).icon {
                return "https:" + iconLink
            }
            return ""
        }
        
        func getTempUnit() -> String {
            if locationSelection == "London" {
                return "Celsius"
            }
            return "Fahrenheit"
        }
    }
}
