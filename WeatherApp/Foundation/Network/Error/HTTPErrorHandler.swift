//
//  HTTPErrorHandler.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

protocol HTTPErrorHandler {
    func handle(response: Response) -> Error
}
