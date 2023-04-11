//
//  ViewState.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

enum ViewState {
    case loading
    case error(message: String)
    case success
}
