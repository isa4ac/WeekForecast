//
//  ForecastDayRow.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import SwiftUI

struct ForecastDayRow: View {
    var date: String
    var value: String
    var icon: String
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https:" + icon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    ProgressView()
                }
            }
            .frame(width: 44, height: 44)
            VStack {
                Text(date)
            }
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}
