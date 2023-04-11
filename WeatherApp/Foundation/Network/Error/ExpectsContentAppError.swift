//
//  ExpectContentTypeError.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct ExpectsContentAppError: AppError {
    private enum Constant {
        static let translationKey = "error.global"
    }
    
    var raw: Error? {
        nil
    }
    
    var messageKey: String {
        return Constant.translationKey
    }
}
