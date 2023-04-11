//
//  EventRequest.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct EventRequest {
    private(set) var action: AppAction
    private(set) var parameters: [String: String]?
    
    init(action: AppAction, parameters: [String: String]? = nil) {
        self.action = action
        self.parameters = parameters
    }
    
    // MARK: Public
    func parameter(key: String) -> String? {
        parameters?[key]
    }
}

enum EventRequestParameterKey {
    enum Forecast {
        static let apiKey = "apiKey"
        static let noOfDays = "noOfDays"
        static let showAqi = "showAqi"
        static let showAlert = "showAlert"
        static let latitude = "latitutde"
        static let longitude = "longitude"
    }
}
