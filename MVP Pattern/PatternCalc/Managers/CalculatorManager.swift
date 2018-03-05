//
//  CalculatorManager.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class CalculatorManager: CalculatorManagerProtocol {
    
    func calculate(with operation: SingleOperation) -> Double? {
        var result = Double()
        
        guard let operationTitle = operation.singleOperation, let value = operation.value  else { return nil }
        
        switch operationTitle {
        case .percent: result = value / 100
        case .power: result = value * value
        }
        
        return result
    }
    
    func calculate(with operation: MultiplayOperation) -> Double? {
        var result = Double()
        
        guard let operationTitle = operation.multiplayOperation, let firstValue = operation.firstValue, let secondValue = operation.secondValue else { return nil }
        
        switch operationTitle {
        case .minus: result = firstValue - secondValue
        case .plus: result = firstValue + secondValue
        case .devide: if (secondValue == 0) { return nil } else {result = firstValue / secondValue}
        case .multiplay: result = firstValue * secondValue
        }
        
        return result
    }
    
}
