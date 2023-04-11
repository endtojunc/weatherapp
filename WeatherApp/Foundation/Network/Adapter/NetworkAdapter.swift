//
//  NetworkAdapter.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

protocol NetworkAdapter {
    func rx_send(request: URLRequest) -> Observable<Response>
}
