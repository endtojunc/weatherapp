//
//  MalformedURLError.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct MalformedURLError: AppError {
    var raw: Error? {
        nil
    }
    
    var messageKey: String {
        "Malformed url."
    }
}
