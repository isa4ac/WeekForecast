//
//  InfoLists.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import Foundation
import SwiftUI

// today's forecast
extension MainContentView {
    @ViewBuilder
    var dayInfo: some View {
        VStack {
            Row(label: "Wind Speed",
                value: String(format: "%.1f", viewModel.selectedLocationWeather.current?.windspeed ?? 0.0) + "mph")
            Row(label: "Wind Direction",
                value: viewModel.selectedLocationWeather.current?.windDirection ?? "")
            Row(label: "Humidity",
                value: String(format: "%.1f", viewModel.selectedLocationWeather.current?.humidity ?? 0.0))
            Row(label: "Feels Like",
                value: String(format: "%.0f", viewModel.selectedLocationWeather.current?.feelsLikeTemp ?? 0.0))
            Row(label: "UV",
                value: String(format: "%.0f", viewModel.selectedLocationWeather.current?.uv ?? 0.0), isLast: true)
        }
    }
}

// week forecast
extension MainContentView {
    @ViewBuilder
    var weekForecast: some View {
        HStack {
            Group {
                AsyncImage(url: URL(string: "https:" + (viewModel.selectedLocationWeather.current?.conditions?.icon ?? ""))) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                    } else if phase.error != nil {
                        ProgressView() // Indicates an error.
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 100, height: 100)
                Text(String(format: "%.0f", viewModel.selectedLocationWeather.current?.temp ?? 0.0) + "°")
                    .font(.system(size: 72))
                    .bold()
            }
            .padding(.leading, -20)
            .frame(alignment: .center)
            
        }
        List() {
            DisclosureGroup {
                dayInfo
                    .listRowSeparator(.hidden)
            } label: {
                Text("Info On Today's Weather")
            }
            Section {
                ForEach(viewModel.getForecastDays(), id: \.self) { day in
                    NavigationLink(destination: DayDetailView(day: day)) {
                        if let dayWeather = day.day {
                            ForecastDayRow(date: day.date ?? "",
                                           value: String(format: "%.0f", dayWeather.highTemp ?? 0.0) + "°",
                                           icon: viewModel.getDayConditionIcon(day))
                        }
                    }
                }
            } header: {
                Text("7-Day Forecast")
            }
        }
        .padding([.leading, .top], -20)
        .scrollContentBackground(.hidden)
    }
}
