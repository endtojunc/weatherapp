//
//  AnyTransformer.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation

final class AnyTransformer<Input, Output>: Transformer {
    private let _transform: (Input) throws -> Output
    
    init<base: Transformer>(base: base) where base.Input == Input, base.Output == Output {
        self._transform = base.transform
    }
    
    func transform(object: Input) throws -> Output {
        try _transform(object)
    }
}
