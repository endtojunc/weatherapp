//
//  View+Nib.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 12/4/23.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
