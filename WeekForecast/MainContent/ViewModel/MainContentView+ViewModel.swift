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
        
        func getForecastDays() -> [ForecastDay] {
            if let forecast = selectedLocationWeather.forecast, let days = forecast.forecastday {
                return days
            }
            return [ForecastDay]()
        }
        
        func getTempUnit() -> String {
            if locationSelection == "London" {
                return "Celsius"
            }
            return "Fahrenheit"
        }
    }
}
