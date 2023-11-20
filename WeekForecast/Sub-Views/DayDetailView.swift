//
//  DayDetailView.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import SwiftUI

struct DayDetailView: View {
    var day: ForecastDay
    var locationSelection: String
    var body: some View {
        VStack {
            Row(label: "High",
                value: day.day?.getHighTemp(locationSelection) ?? "")
            Row(label: "Low",
                value: day.day?.getLowTemp(locationSelection) ?? "")
            Row(label: "Max Wind Speed",
                value: day.day?.getWindSpeed(locationSelection) ?? "")
            Row(label: "Condition",
                value: day.day?.condition?.text ?? "",
                isLast: true)
            Spacer()
        }
        .navigationTitle(day.date ?? "")
        .padding()
    }
}
