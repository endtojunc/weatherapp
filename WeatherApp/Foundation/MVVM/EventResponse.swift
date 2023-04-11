//
//  EventResponse.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

protocol EventResponse {
    var succeed: Bool { get }
    var data: [String: Any]? { get }
    var error: Error? { get }
    var code: EventResponseCode { get }
}
