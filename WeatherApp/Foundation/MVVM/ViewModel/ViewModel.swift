//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

protocol ViewModel {
    associatedtype Model
    func handle(request: EventRequest) -> Observable<Model>
}
