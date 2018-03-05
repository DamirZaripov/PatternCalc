//
//  MultiplayOperation.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Mathematical operation with two arguments
class MultiplayOperation {
    var firstValue: Double?
    var secondValue: Double?
    var multiplayOperation: MultiplayOperations?
}

/// Options for a MultiplayOperation
///
/// - plus: add two numbers
/// - minus: subtract from the first number the second
/// - multiplay: multiplication of two arguments
/// - devide: devide of two arguments
enum MultiplayOperations: String {
    case plus = "+"
    case minus = "-"
    case multiplay = "*"
    case devide = "/"
}
