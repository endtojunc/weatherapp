//
//  Response.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

protocol Response {
    var succeed: Bool { get }
    var data: Data? { get }
    var error: Error? { get }
}
