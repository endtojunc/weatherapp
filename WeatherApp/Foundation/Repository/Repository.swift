//
//  Repository.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 9/4/23.
//

import Foundation
import RxSwift

protocol Repository {
    associatedtype Resource
    func get(with parameter: RepositoryParameter) -> Observable<Result<Resource>>
}
