//
//  AppEventResponse.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct AppEventResponse: EventResponse {
    private let _data: [String : Any]?
    private let _error: Error?
    private let _code: EventResponseCode
    
    init(code: EventResponseCode, data: [String : Any]? = nil, error: Error? = nil) {
        self._data = data
        self._error = error
        self._code = code
    }
    
    var succeed: Bool {
        if error != nil {
            return false
        }
        return true
    }
    
    var data: [String : Any]? {
        return _data
    }
    
    var error: Error? {
        return _error
    }
    
    var code: EventResponseCode {
        return _code
    }
}
