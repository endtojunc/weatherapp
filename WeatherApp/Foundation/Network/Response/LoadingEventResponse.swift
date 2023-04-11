//
//  LoadingEventResponse.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct LoadingEventResponse: EventResponse {
    var succeed: Bool {
        return true
    }
    
    var data: [String: Any]? {
        return [
            EventParameterKey.viewState: ViewState.loading,
        ]
    }
    
    var error: Error? {
        return nil
    }
    
    var code: EventResponseCode {
        return .processing
    }
}
