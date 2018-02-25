//
//  CalculatorManagerProtocol.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

protocol CalculatorManagerProtocol {
    func toCount(with operation: SingleOperation) -> Double?
    func toCount(with operation: MultiplayOperation) -> Double?
}
