//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String]? { get }
    var bodyParameters: [String: Any]? { get }
    var queryParameters: [String: String]? { get }
}

extension Endpoint {
    var headers: [String: String]? {
        nil
    }
    
    var bodyParameters: [String: Any]? {
        nil
    }
    
    var queryParameters: [String: String]? {
        nil
    }
}
