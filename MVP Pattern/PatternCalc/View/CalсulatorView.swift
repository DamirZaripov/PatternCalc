//
//  CalculatorView.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Input protocol for View
protocol CalculatorView: class {
    
    /// Set text to display
    ///
    /// - Parameter text: digits to display
    func setTextToDigitsLabel(text: String)
    
    /// Show error alert on display
    ///
    /// - Parameter message: error message
    func showErrorAlert(with message: String)
}
