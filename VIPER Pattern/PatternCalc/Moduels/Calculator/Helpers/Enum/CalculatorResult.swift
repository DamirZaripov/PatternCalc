//
//  CalculatorResult.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 27.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Calculation result
///
/// - success: successful execution
/// - failure: failure execution
enum CalculatorResult{
    case success(with: String)
    case failure(with: String)
}
