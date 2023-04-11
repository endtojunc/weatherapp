//
//  MainContainer.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 11/4/23.
//

import Foundation
import Swinject

final class MainContainer: AppContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        
        register()
    }
    
    func getChild() -> Container {
        Container(parent: container)
    }
    
    func resolve<Service>(serviceType: Service.Type) -> Service? {
        container.resolve(serviceType)
    }
    
    func resolve<Service>(serviceType: Service.Type, name: String) -> Service? {
        container.resolve(serviceType, name: name)
    }
    
    private func register() {
        container.register(NetworkAdapter.self) { (resolver) -> NetworkAdapter in
            URLSessionNetworkAdapter(session: URLSession(configuration: .ephemeral))
        }.inObjectScope(.container)
        
        container.register(HTTPClientType.self) { (resolver) -> HTTPClientType in
            AppHTTPClientType(transformer: AnyTransformer(base: EndpointToURLRequestTransformer()),
                              networkAdapter: resolver.resolve(NetworkAdapter.self)!,
                              httpErrorHandler: AppHTTPErrorHandler())
        }.inObjectScope(.container)
        
        container.register(AnyRepository<Weather>.self) { (resolver) -> AnyRepository in
            AnyRepository(base: ForecastRepository(httpClient: resolver.resolve(HTTPClientType.self)!))
        }
        
        container.register(HomeViewModel.self) { (resovler) -> HomeViewModel in
            HomeViewModel(viewState: .loading, repository: resovler.resolve(AnyRepository<Weather>.self)!)
        }.inObjectScope(.container)
        
        container.register(HomeViewController.self) { (resolver) -> HomeViewController in
            HomeViewController(view: HomeView(), homeViewModel: resolver.resolve(HomeViewModel.self)!)
        }.inObjectScope(.container)
    }
}
