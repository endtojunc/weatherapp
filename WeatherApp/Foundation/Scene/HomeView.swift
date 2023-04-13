//
//  HomeView.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 11/4/23.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

final class HomeView: UIView, ViewType {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var hierarchyNotReady = true
    private var weather: Weather?
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        guard hierarchyNotReady else {
            return
        }
        
        setupViews()
        
        hierarchyNotReady = false
    }
    
    
    private func setupViews() {
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        tableView.register(HourlyForecastTableViewCell.self, forCellReuseIdentifier: "hourlyforecast")
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: "dailyforecast")
        tableView.register(CurrentTableViewCell.self, forCellReuseIdentifier: "current")
    }
    
    func request() -> Observable<EventRequest> {
        Observable.never()
    }
    
    func update(with provider: Driver<HomeViewModel>) {
        _ = provider.map { viewModel in
            switch viewModel.viewState {
            case .success:
                break
            default:
                break
            }
        }
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let c = tableView.dequeueReusableCell(withIdentifier: "hourlyforecast", for: indexPath) as? HourlyForecastTableViewCell {
            cell = c
        } else if let c = tableView.dequeueReusableCell(withIdentifier: "dailyforecast", for: indexPath) as? DailyForecastTableViewCell {
            cell = c
        } else if let c = tableView.dequeueReusableCell(withIdentifier: "current", for: indexPath) as? CurrentTableViewCell {
            cell = c
        }
        
        return cell
    }
}
