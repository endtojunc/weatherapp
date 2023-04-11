//
//  HTTPClientType.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

protocol HTTPClientType {
    func request<T: Decodable>(endpoint: Endpoint) -> Observable<Result<T>>
}
