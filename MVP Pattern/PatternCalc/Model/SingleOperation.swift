//
//  SingleOperation.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// A mathematical operation with one argument
class SingleOperation {
    var value: Double?
    var singleOperation: SingleOperations?
}

/// Options for a SingleOperation
///
/// - percent: calculate the percentage
/// - power: calculate the power
enum SingleOperations: String {
    case percent = "%"
    case power = "x²"
}
