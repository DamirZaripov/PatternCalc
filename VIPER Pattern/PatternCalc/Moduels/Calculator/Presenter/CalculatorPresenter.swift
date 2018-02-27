//
//  CalculatorPresenter.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

class CalculatorPresenter: CalculatorViewOutput, CalculatorInteractorOutput{
    
    weak var view: CalсulatorViewInput!
    var interactor: CalсulatorInteractorInput!
    var router: CalculatorRouter!
    var alertsFactory: AlertsFactoryProtocol!
    
    let zeroText = "0"
    let comma = ","
    let point = "."
    var waitNewValue = false
    
    // MARK: - Calculator View Output Protocol
    
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
        guard let value = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        interactor.toCountSingleOperation(with: value, and: operation)
    }
    
    func onMultiplayOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String) {
        guard let value = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        interactor.toSetMuptiplayOpertaion(with: value, and: operation)
    }
    
    func onEqullyButtonPressed(value digitsLabelText: String) {
        guard let value = convertDigitsLabelToValue(from: digitsLabelText) else { return }
        interactor.toCountMultiPlayOpetaion(with: value)
    }
    
    // MARK: - Calculator Interactor Output Protocol
    
    func didFinishToCountSingleOperation(with result: Double) {
        let stringResult = formatNumber(value: result)
        view.setTextToDigitsLabel(text: stringResult)
        waitNewValue = true
    }
    
    func didFinishToSetMultiplayOperation() {
        waitNewValue = true
    }
    
    func didFinishToCountMuptiplayOperation(with result: CalculatorResult) {
        switch result {
        case .Success(let successResult):
            let strinResult = formatNumber(value: successResult)
            view.setTextToDigitsLabel(text: strinResult)
        case .Failure(let errorResult):
            let alert = alertsFactory.getErrorAlert(with: errorResult)
            router.showAlert(alert: alert)
        }
        waitNewValue = true
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
            return String(Int(value))
        } else {
            return toReplacmentPointToComma(from: value)
        }
    }
    
}
