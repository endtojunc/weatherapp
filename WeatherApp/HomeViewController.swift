//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 11/4/23.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import CoreLocation

final class HomeViewController: UIViewController {
    private let homeView: HomeView
    private let homeViewModel: HomeViewModel
    
    var locationManager: CLLocationManager
    var lat: CLLocationDegrees = 0.0
    var lng: CLLocationDegrees = 0.0
    
    init(view: HomeView, homeViewModel: HomeViewModel) {
        self.homeView = view
        self.homeViewModel = homeViewModel
        self.locationManager = CLLocationManager()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = homeView.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = 100
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = CLLocationDistanceMax
        locationManager.delegate = self
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinates = locations.last
        lat = coordinates?.coordinate.latitude ?? 0.0
        lng = coordinates?.coordinate.longitude ?? 0.0
        
        let output = homeViewModel
            .handle(request: EventRequest(action: .viewDidLoad, parameters: [
                EventRequestParameterKey.Forecast.apiKey: Bundle.main.apiBaseURL,
                EventRequestParameterKey.Forecast.noOfDays: 7.string,
                EventRequestParameterKey.Forecast.showAqi: false.string,
                EventRequestParameterKey.Forecast.showAlert: false.string,
                EventRequestParameterKey.Forecast.latitude: lat.string,
                EventRequestParameterKey.Forecast.longitude: lng.string
            ]))
        
        let provider = output
            .asDriver { (_) -> SharedSequence<DriverSharingStrategy, HomeViewModel> in
                return Driver.never()
            }
        
        homeView.update(with: provider)
    }
}
