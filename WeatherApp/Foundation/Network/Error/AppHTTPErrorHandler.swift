//
//  AppHTTPErrorHandler.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct AppHTTPErrorHandler: HTTPErrorHandler {
    func handle(response: Response) -> Error {
        return NetworkAppError(error: response.error)
    }
}
