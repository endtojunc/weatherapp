//
//  TestViewController.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 13/4/23.
//

import Foundation
import UIKit

final class TestViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
