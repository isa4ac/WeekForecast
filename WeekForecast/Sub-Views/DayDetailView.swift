//
//  DayDetailView.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import SwiftUI

struct DayDetailView: View {
    var day: ForecastDay
    var body: some View {
        VStack {
            Row(label: "High",
                value: String(format: "%.1f", day.day?.highTemp ?? 0.0) + "mph")
            Row(label: "Low",
                value: String(format: "%.1f", day.day?.lowTemp ?? 0.0) + "mph")
            Row(label: "Max Wind Speed",
                value: String(format: "%.1f", day.day?.maxWindSpeed ?? 0.0))
            Row(label: "Condition",
                value: day.day?.condition?.text ?? "",
                isLast: true)
            Spacer()
        }
        .navigationTitle(day.date ?? "")
        .padding()
    }
}
