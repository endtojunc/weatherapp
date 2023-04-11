//
//  HTTPStatusCode.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

enum HTTPStatusCode: Int {
    case ok = 200
    case noContent = 201
    case badRequest = 400
    case unauthorised = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case serverUnavailable = 503
}
