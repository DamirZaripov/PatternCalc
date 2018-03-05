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
    
    let zeroText = "0"
    let comma = ","
    let point = "."
    var waitNewValue = false

    func calculateSingleOperation(value digitsLabelText: String, operationTitle operation: String) {
        guard let value = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        guard let operationTitle = SingleOperations(rawValue: operation) else { return }
        
        var result = Double()
        switch operationTitle {
        case .percent: result = value / 100
        case .power: result = value * value
        }
        
        waitNewValue = true
        let stringResult = formatNumber(value: result)
        presenter.didFinishToCountSingleOperation(with: stringResult)
    }

    
    func toSetMuptiplayOpertaion(value digitsLabelText: String, operationTitle operation: String) {
        guard let value = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        guard let operationTitle = MultiplayOperations(rawValue: operation) else { return }
        self.firstValue = value
        self.multiplayOperation = operationTitle.rawValue
        waitNewValue = true
    }
    
    func calculateMultiPlayOpetaion(value digitsLabelText: String) {
        guard let secondValue = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        guard let value = firstValue, let operation = multiplayOperation else { return }
        guard let currentOperation = MultiplayOperations(rawValue: operation) else { return }
        
        if ((secondValue == 0) && (currentOperation.rawValue == "/")) {
            presenter.didFinishToCountMuptiplayOperation(with: .failure(with: errorMessage))
        }
        
        var result = Double()
        
        switch currentOperation {
        case .minus: result = value - secondValue
        case .plus: result = value + secondValue
        case .devide: result = value / secondValue
        case .multiplay: result = value * secondValue
        }
        
        waitNewValue = true
        let stringResult = formatNumber(value: result)
        presenter.didFinishToCountMuptiplayOperation(with: .success(with: stringResult))
    }
    
    func processingOfClickDigitButton(with numberTitle: String, and digitsLabelText: String) {
        if (waitNewValue) {
            presenter.didFinishedProcessingOfClickDigitButton(with: numberTitle)
            waitNewValue = false
            return
        }
        
        if ((digitsLabelText == zeroText) && (numberTitle == zeroText)) {
            presenter.didFinishedProcessingOfClickDigitButton(with: digitsLabelText)
            return
        }
        
        if ((digitsLabelText == zeroText) && (numberTitle != zeroText)) {
            presenter.didFinishedProcessingOfClickDigitButton(with: numberTitle)
            return
        }
        
        if (digitsLabelText != zeroText) {
            presenter.didFinishedProcessingOfClickDigitButton(with: digitsLabelText + numberTitle)
            return
        }
    }
    
    func processingOfCommaButton(with digitsLabelText: String){
        guard !digitsLabelText.contains(comma), !waitNewValue else { return }
        presenter.didFinishedProcessingOfCommaButton(with: digitsLabelText + comma)
    }
    
    func processingOfClearButton() {
        presenter.didFinishedProcessingOfClearButton(with: zeroText)
    }
    
    
    // MARK: - Helpers
    func convertDigitsLabelToValue(from text: String) -> Double? {
        let stringWithoutComma = toReplacmentCommaToPoint(from: text)
        let doubleValue = convertStringToDouble(from: stringWithoutComma)
        return doubleValue
    }
    
    func toReplacmentCommaToPoint(from text: String) -> String {
        let result = text.replacingOccurrences(of: comma, with: point)
        return result
    }
    
    func toReplacmentPointToComma(from value: Double) -> String {
        let result = String(value).replacingOccurrences(of: comma, with: point)
        return result
    }
    
    func convertStringToDouble(from text: String) -> Double? {
        guard let result = Double(text) else { return nil }
        return result
    }
    
    func formatNumber(value: Double) -> String {
        let isInteger = value.truncatingRemainder(dividingBy: 1) == 0
        if (isInteger) {
            return String(Double(value))
        } else {
            return toReplacmentPointToComma(from: value)
        }
    }
}
