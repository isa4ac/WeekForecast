//
//  MainContentView.swift
//  Week Forecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import SwiftUI

struct MainContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var forcast = ForcastModel()
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Location", selection: $viewModel.locationSelection) {
                    ForEach(Array(forcast.weatherData.keys.sorted()), id: \.self) { location in
                        Text(location)
                            .tag(location as String?)
                    }
                }
                .onChange(of: viewModel.locationSelection) {
                    viewModel.selectedLocationWeather = forcast.weatherData[viewModel.locationSelection] ?? WeatherDataset()
                }
                .pickerStyle(.segmented)
                
                
                weekForecast
            }
            .padding()
            .onAppear {
                forcast.readData()
                viewModel.selectedLocationWeather = forcast.weatherData[viewModel.locationSelection] ?? WeatherDataset()
            }
            .navigationTitle("Forecast")
        }
    }
}

#Preview {
    MainContentView()
}
