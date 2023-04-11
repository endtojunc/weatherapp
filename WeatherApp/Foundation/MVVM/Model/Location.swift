//
//  Location.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

struct Location: Codable {
    private(set) var name: String
    private(set) var country: String
    private(set) var lat: Float
    private(set) var lng: Float
    private(set) var localTimeEpoch: UInt
    private(set) var localTime: String
}
