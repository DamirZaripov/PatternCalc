//
//  ReusableView.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 06.03.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import UIKit

/// Protocol for instantiate view controller from storybord
protocol ReusableView: class {
}

extension ReusableView {
    
    /// Identifier is name of view controller
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableView{
}

extension UIStoryboard {
    func instantiateViewController<T>() -> T where T: ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }
}
