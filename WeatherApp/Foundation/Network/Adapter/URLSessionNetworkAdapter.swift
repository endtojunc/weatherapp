//
//  URLSessionNetworkAdapter.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

final class URLSessionNetworkAdapter: NetworkAdapter {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func rx_send(request: URLRequest) -> Observable<Response> {
        return Observable.create { [weak self] observer in
            let task = self?.session.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else { return
                    observer.onError(NetworkAppError(error: error))
                    return
                }
                
                observer.onNext(AppResponse(data: data, response: response, error: error))
                observer.onCompleted()
            }
            
            let t = task
            task?.resume()
            
            return Disposables.create {
                t?.cancel()
            }
        }
    }
}
