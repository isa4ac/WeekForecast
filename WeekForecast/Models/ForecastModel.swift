//
//  ForcastModel.swift
//  WeekForecast
//
//  Created by Isaac Vanmeter on 11/15/23.
//

import Foundation
import SwiftUI

class ForcastModel: ObservableObject {
    @Published var weatherData = [String : WeatherDataset]()
    
    // this function will read data from the 3 json files within the project in insert the data into the models inside of WeatherDataset
    func readData() {
        var resources = ["Cincinnati", "Honolulu", "London"]
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        for resource in resources {
            if let path = Bundle.main.path(forResource: resource, ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    guard let weatherDataSet = try? decoder.decode(WeatherDataset.self, from: data) else {
                        fatalError("Failed to decode \(resource) from bundle.")
                    }
                    weatherData[resource] = weatherDataSet
                } catch {
                    print("error reading files.")
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
