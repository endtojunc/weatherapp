//
//  AppContainer.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 11/4/23.
//

import Foundation
import Swinject

protocol AppContainer {
    func getChild() -> Container
    func resolve<Service>(serviceType: Service.Type) -> Service?
    func resolve<Service>(serviceType: Service.Type, name: String) -> Service?
}
