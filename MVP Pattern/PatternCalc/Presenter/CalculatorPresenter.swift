//
//  CalculatorPresenter.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class CalculatorPresenter: CalculatorViewPresenter {
    
    weak var view: CalculatorView!
    var calculatorManager: CalculatorManager!
    var singleOperation: SingleOperation!
    var multiplayOperation: MultiplayOperation!
    let zeroText = "0"
    let comma = ","
    let alertErrorMessage = "Нельзя делить на ноль"
    var waitNewValue = false
    
    required init(calculatorView: CalculatorView) {
        self.view = calculatorView
    }
    
    // MARK: - Calculator View Presenter Protocol
    
    func onNumbersButtonPressed(with numberTitle: String, and digitsLabelText: String) {
        if (waitNewValue) {
            view.setTextToDigitsLabel(text: numberTitle)
            waitNewValue = false
            return
        }
        
        if ((digitsLabelText == zeroText) && (numberTitle == zeroText)) {
            view.setTextToDigitsLabel(text: digitsLabelText)
        }
        
        if ((digitsLabelText == zeroText) && (numberTitle != zeroText)) {
            view.setTextToDigitsLabel(text: numberTitle)
        }
        
        if (digitsLabelText != zeroText) {
            view.setTextToDigitsLabel(text: digitsLabelText + numberTitle)
        }
    }
    
    func onCommaButtonPressed(with digitsLabelText: String) {
        guard !digitsLabelText.contains(comma), !waitNewValue else { return }
        view.setTextToDigitsLabel(text: digitsLabelText + comma)
    }
    
    func onClearButtonPressed() {
        view.setTextToDigitsLabel(text: zeroText)
    }
    
    func onSingleOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String) {
        waitNewValue = true
        singleOperation.value = convertDigitsLabelToValue(from: digitsLabelText)
        singleOperation.singleOperation = SingleOperations(rawValue: operation)
        guard let result = calculatorManager.toCount(with: singleOperation) else { return }
        let stringResult = formatNumber(value: result)
        view.setTextToDigitsLabel(text: stringResult)
    }
    
    func onMultiplayOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String) {
        multiplayOperation.firstValue = convertDigitsLabelToValue(from: digitsLabelText)
        multiplayOperation.multiplayOperation = MultiplayOperations(rawValue: operation)
        waitNewValue = true
    }
    
    
    func onEqullyButtonPressed(value digitsLabelText: String) {
        if ((multiplayOperation.firstValue == nil) || (multiplayOperation.multiplayOperation == nil)) {
            waitNewValue = false
            return
        } else {
            multiplayOperation.secondValue = convertDigitsLabelToValue(from: digitsLabelText)
            guard let result = calculatorManager.toCount(with: multiplayOperation)
                else { view.showErrorAlert(with: alertErrorMessage)
                    return
            }
            let stringResult = formatNumber(value: result)
            view.setTextToDigitsLabel(text: stringResult)
            waitNewValue = true
        }
    }
    
    // MARK: - Helpers
    
    func convertDigitsLabelToValue(from text: String) -> Double? {
        let stringWithoutComma = toReplacmentCommaToPoint(from: text)
        let doubleValue = convertStringToDouble(from: stringWithoutComma)
        return doubleValue
    }
    
    func toReplacmentCommaToPoint(from text: String) -> String {
        let result = text.replacingOccurrences(of: ",", with: ".")
        return result
    }
    
    func toReplacmentPointToComma(from value: Double) -> String {
        let result = String(value).replacingOccurrences(of: ".", with: ",")
        return result
    }
    
    func convertStringToDouble(from text: String) -> Double? {
        guard let result = Double(text) else { return nil }
        return result
    }
    
    func formatNumber(value: Double) -> String {
        let isInteger = value.truncatingRemainder(dividingBy: 1) == 0
        if (isInteger) {
            return String(Int(value))
        } else {
            return toReplacmentPointToComma(from: value)
        }
    }
    
}
