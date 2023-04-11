//
//  ForecastRepositoryParameter.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct ForecastRepositoryParameter: RepositoryParameter {
    var noOfDays: String
    var showAqi: String
    var showAlerts: String
    var apiKey: String
    var latitude: String
    var longitude: String
}
