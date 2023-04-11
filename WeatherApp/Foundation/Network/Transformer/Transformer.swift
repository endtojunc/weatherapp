//
//  Transformer.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation
import RxSwift

protocol Transformer {
    associatedtype Input
    associatedtype Output
    
    func transform(object: Input) throws -> Output
}

extension Transformer {
    func rx_transform(object: Input) -> Observable<Output> {
        return Observable.create { observer -> Disposable in
            do {
                observer.onNext(try self.transform(object: object))
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create()
        }
    }
}
