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
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dailyForecastCollectionView: UICollectionView!
    @IBOutlet weak var hourlyForecastCollectionView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    
    private var hierarchyNotReady = true
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        guard hierarchyNotReady else {
            return
        }
        
        setupViews()
        
        hierarchyNotReady = false
    }
    
    private func setupViews() {
        dailyForecastCollectionView.dataSource = self
        hourlyForecastCollectionView.dataSource = self
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

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        return cell
    }
}

class ForecastCollectionViewCell: UICollectionViewCell {
    
}
