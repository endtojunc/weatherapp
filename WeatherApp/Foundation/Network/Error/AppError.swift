//
//  AppError.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

protocol AppError: Error {
    var raw: Error? { get }
    var messageKey: String { get }
}
