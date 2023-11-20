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
            getDayCondition(day).icon ?? ""
        }
    }
}
