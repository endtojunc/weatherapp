//
//  Bundle.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 11/4/23.
//

import Foundation

extension Bundle {
    var apiBaseURL: String {
        return object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
}
