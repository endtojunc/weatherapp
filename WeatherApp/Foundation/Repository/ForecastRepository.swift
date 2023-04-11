//
//  ForecastRepository.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

final class ForecastRepository: Repository {
    private let httpClient: HTTPClientType
    
    init(httpClient: HTTPClientType) {
        self.httpClient = httpClient
    }
    
    func get(with parameter: RepositoryParameter) -> Observable<Result<Weather>> {
        guard let parameter = parameter as? ForecastRepositoryParameter else {
            return Observable.error(ParameterTypeError(developerMessage: "parameter should be typed GetVideoSourcesParameter"))
        }
        
        return httpClient.request(endpoint: ForecastEndpoint.dailyForecast(parameter: parameter))
    }
}
