//
//  MultiplayOperation.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class MultiplayOperation {
    var firstValue: Double?
    var secondValue: Double?
    var multiplayOperation: MultiplayOperations?
}

enum MultiplayOperations: String {
    case plus = "+"
    case minus = "-"
    case multiplay = "*"
    case devide = "/"
}
