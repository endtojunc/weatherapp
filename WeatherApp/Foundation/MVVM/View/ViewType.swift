//
//  ViewType.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewType {
    
    associatedtype ViewModel
    
    func request() -> Observable<EventRequest>
    func update(with provider: Driver<ViewModel>)
}

extension ViewType where Self: UIView {
    var view: UIView {
        self
    }
}
