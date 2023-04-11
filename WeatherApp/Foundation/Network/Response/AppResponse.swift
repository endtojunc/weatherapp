//
//  AppResponse.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct AppResponse: Response {
    
    private let _data: Data?
    private let httpResponse: URLResponse?
    private let _error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self._data = data
        self.httpResponse = response
        self._error = error
    }
    
    var succeed: Bool {
        guard let httpResponse = httpResponse as? HTTPURLResponse else { return false }
        
        return httpResponse.statusCode >= HTTPStatusCode.ok.rawValue && httpResponse.statusCode <= HTTPStatusCode.badRequest.rawValue
    }
    
    var data: Data? {
        _data
    }
    
    var error: Error? {
        _error
    }
}
