//
//  AnyRepository.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation
import RxSwift

final class AnyRepository<T>: Repository {
    private let _get: (RepositoryParameter) -> Observable<Result<T>>
    
    init<R: Repository>(base: R) where R.Resource == T {
        self._get = base.get
    }
    
    func get(with parameter: RepositoryParameter) -> Observable<Result<T>> {
        _get(parameter)
    }
}
