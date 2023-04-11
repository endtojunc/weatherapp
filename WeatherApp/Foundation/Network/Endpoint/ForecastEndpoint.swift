//
//  ForecastEndpoint.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

enum ForecastEndpoint: Endpoint {
    
    case dailyForecast(parameter: ForecastRepositoryParameter)
    
    var baseUrl: String {
        ""
    }
    
    private enum Constant {
        static let path = "foreacst.json"
        enum Params {
            static let baseUrl = ""
            static let key = "key"
            static let days = "days"
            static let aqi = "aqi"
            static let alerts = "alerts"
        }
    }
    
    var queryParameters: [String : String]? {
        if case let .dailyForecast(parameter) = self {
            return [
                Constant.Params.days: String(parameter.noOfDays),
                Constant.Params.aqi: "no",
                Constant.Params.alerts: "no"
            ]
        }
        return nil
    }
    
    var path: String { Constant.path }
    
    var httpMethod: HTTPMethod { .get }
}
