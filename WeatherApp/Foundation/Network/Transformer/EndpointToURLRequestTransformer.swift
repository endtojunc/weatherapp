//
//  EndpointToURLRequestTransformer.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation

struct EndpointToURLRequestTransformer: Transformer {
    func transform(object: Endpoint) throws -> URLRequest {
        guard let url = URL(string: object.baseUrl) else {
            throw MalformedURLError()
        }
        
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if let queryParameter = object.queryParameters {
            urlComponent?.queryItems = queryParameter.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let finalUrl = urlComponent?.url else { throw MalformedURLError() }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = object.httpMethod.rawValue
        
        object.headers?.forEach({ (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        })
        
        return request
    }
}
