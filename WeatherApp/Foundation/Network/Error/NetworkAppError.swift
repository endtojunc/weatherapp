//
//  NetworkAppError.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct NetworkAppError: AppError {
    
    private let error: Error?
    
    init(error: Error?) {
        self.error = error
    }
    
    var raw: Error? {
        error
    }
    
    var messageKey: String {
        error?.localizedDescription ?? ""
    }
}
