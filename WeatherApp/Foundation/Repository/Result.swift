//
//  Result.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

enum Result<T> {
    case noContent
    case value(T)
}
