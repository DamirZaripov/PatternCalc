//
//  CalculatorInteractor.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class CalculatorInteractor: CalсulatorInteractorInput{
    
    weak var presenter: CalculatorInteractorOutput!
    var singleOperation: String?
    var multiplayOperation: String?
    var firstValue: Double?
    let errorMessage = "Нельзя делить на ноль"
    
    func toCountSingleOperation(with value: Double, and operation: String) {
        var result = Double()
        guard let operationTitle = SingleOperations(rawValue: operation) else { return }
        
        switch operationTitle {
        case .percent: result = value / 100
        case .power: result = value * value
        }
        
        presenter.didFinishToCountSingleOperation(with: result)
    }
    
    func toSetMuptiplayOpertaion(with value: Double, and operation: String) {
        guard let operationTitle = MultiplayOperations(rawValue: operation) else { return }
        self.firstValue = value
        self.multiplayOperation = operationTitle.rawValue
        
        presenter.didFinishToSetMultiplayOperation()
    }
    
    func toCountMultiPlayOpetaion(with secondValue: Double) {
        var result = Double()
        
        guard let value = firstValue, let operation = multiplayOperation else { return }
        guard let currentOperation = MultiplayOperations(rawValue: operation) else { return }
        
        if ((secondValue == 0) && (currentOperation.rawValue == "/")) {
            presenter.didFinishToCountMuptiplayOperation(with: .Failure(errorMessage))
        }
        
        switch currentOperation {
        case .minus: result = value - secondValue
        case .plus: result = value + secondValue
        case .devide: result = value / secondValue
        case .multiplay: result = value * secondValue
        }
        
        presenter.didFinishToCountMuptiplayOperation(with: .Success(result))
    }
}
