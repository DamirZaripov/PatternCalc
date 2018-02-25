//
//  SingleOperation.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class SingleOperation {
    var value: Double?
    var singleOperation: SingleOperations?
}

enum SingleOperations: String {
    case percent = "%"
    case power = "x²"
}
