//
//  CalculatorView.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Input protocol for Calculator View
protocol CalсulatorViewInput: class {
    
    /// Set number to display
    ///
    /// - Parameter text: number
    func setTextToDigitsLabel(text: String)
}
