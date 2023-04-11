//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

final class HomeViewModel: ViewModel {
     
    private(set) var viewState: ViewState
    private(set) var weather: Weather?
    private let repository: AnyRepository<Weather>
    
    init(viewState: ViewState, repository: AnyRepository<Weather>) {
        self.viewState = viewState
        self.repository = repository
    }
    
    func handle(request: EventRequest) -> Observable<HomeViewModel> {
        guard let parameters = request.parameters else {
            return Observable.error(ParameterTypeError(developerMessage: "Parameter cannot be empty"))
        }
        
        let loading: Observable<HomeViewModel> = Observable.just(self).map {
            $0.viewState = .loading
            return self
        }
        
        guard let apiKey = parameters[EventRequestParameterKey.Forecast.apiKey],
              let noOfDays = parameters[EventRequestParameterKey.Forecast.noOfDays],
              let showAqi = parameters[EventRequestParameterKey.Forecast.showAqi],
              let showAlerts = parameters[EventRequestParameterKey.Forecast.showAlert],
              let lattiude = parameters[EventRequestParameterKey.Forecast.latitude],
              let longitude = parameters[EventRequestParameterKey.Forecast.longitude] else {
            return Observable.error(ParameterTypeError(developerMessage: "Parameter cannot be empty"))
        }
        
        let data: Observable<HomeViewModel> =
        repository.get(with: ForecastRepositoryParameter(
            noOfDays: noOfDays, showAqi: showAqi, showAlerts: showAlerts, apiKey: apiKey, latitude: lattiude, longitude: longitude)
        )
        .map { (result) -> HomeViewModel in
            switch result {
            case .noContent:
                throw ExpectsContentAppError()
            case let .value(weather):
                self.viewState = .success
                self.weather = weather
                return self
            }
        }.catch { error in
            Observable.just(self).map {
                $0.viewState = .error(message: error.localizedDescription)
                return self
            }
        }
        return Observable.of(loading, data).merge()
    }
}
