//
//  CalculatorRouterProtocol.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 27.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

/// Protocol for Calculator Router
protocol CalculatorRouterProtocol: class {
    
    /// Show error allert
    ///
    /// - Parameter message: error message
    func showErrorAlert(with message: String)
}
