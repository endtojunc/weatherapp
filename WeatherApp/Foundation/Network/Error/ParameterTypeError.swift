//
//  ParameterTypeError.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct ParameterTypeError: AppError {
    private let developerMessage: String
    
    private enum Constant {
        static let translationKey = "error.global.default"
    }
    
    init(developerMessage: String) {
        self.developerMessage = developerMessage
    }
    
    // MARK: AppError
    
    var raw: Error? {
        return nil
    }
    
    var messageKey: String {
        return Constant.translationKey
    }
}
