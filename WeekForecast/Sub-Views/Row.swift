//
//  Row.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import SwiftUI

struct Row: View {
    var label: String
    var value: String
    var isLast = false
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
        if !isLast {
            Divider()
        }
    }
}
