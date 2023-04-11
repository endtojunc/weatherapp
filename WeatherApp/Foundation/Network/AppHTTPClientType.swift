//
//  AppHTTPClientType.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 10/4/23.
//

import Foundation
import RxSwift

final class AppHTTPClientType: HTTPClientType {
    private let transformer: AnyTransformer<Endpoint, URLRequest>
    private let networkAdapter: NetworkAdapter
    private let httpErrorHandler: HTTPErrorHandler
    
    init(transformer: AnyTransformer<Endpoint, URLRequest>, networkAdapter: NetworkAdapter, httpErrorHandler: HTTPErrorHandler) {
        self.transformer = transformer
        self.networkAdapter = networkAdapter
        self.httpErrorHandler = httpErrorHandler
    }
    
    func request<T>(endpoint: Endpoint) -> Observable<Result<T>> where T : Decodable {
        let networkAdapter = self.networkAdapter
        let transformer = self.transformer
        let httpErrorHandler = self.httpErrorHandler
        
        return transformer
            .rx_transform(object: endpoint)
            .flatMap { networkAdapter.rx_send(request: $0 )}
            .flatMap { (response) -> Observable<Result<T>> in
                if response.succeed == false {
                    return Observable.error(httpErrorHandler.handle(response: response))
                }
                
                guard let data = response.data else {
                    return Observable.just(Result.noContent)
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let object = try jsonDecoder.decode(T.self, from: data)
                    
                    return Observable.just(Result.value(object))
                } catch {
                    return Observable.error(error)
                }
            }
    }
}
