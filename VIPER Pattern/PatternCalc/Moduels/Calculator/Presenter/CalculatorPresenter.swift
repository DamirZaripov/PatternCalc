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
    
    // MARK: - Calculator View Output Protocol
    
    func onNumbersButtonPressed(with numberTitle: String, and digitsLabelText: String) {
        interactor.processingOfClickDigitButton(with: numberTitle, and: digitsLabelText)
    }
    
    func onCommaButtonPressed(with digitsLabelText: String) {
        interactor.processingOfCommaButton(with: digitsLabelText)
    }
    
    func onClearButtonPressed() {
        interactor.processingOfClearButton()
    }
    
    func onSingleOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String) {
        interactor.calculateSingleOperation(value: digitsLabelText, operationTitle: operation)
    }
    
    func onMultiplayOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String) {
        interactor.toSetMuptiplayOpertaion(value: digitsLabelText, operationTitle: operation)
    }
    
    func onEqullyButtonPressed(value digitsLabelText: String){
        interactor.calculateMultiPlayOpetaion(value: digitsLabelText)
    }
    
    // MARK: - Calculator Interactor Output Protocol
    
    func didFinishedProcessingOfClickDigitButton(with result: String){
        view.setTextToDigitsLabel(text: result)
    }
    
    func didFinishedProcessingOfClearButton(with result: String){
        view.setTextToDigitsLabel(text: result)
    }
    
    func didFinishedProcessingOfCommaButton(with result: String){
        view.setTextToDigitsLabel(text: result)
    }
  
    func didFinishToCountSingleOperation(with result: String) {
        view.setTextToDigitsLabel(text: result)
    }
    
    func didFinishToCountMuptiplayOperation(with result: CalculatorResult){
        switch result {
        case .success(let successResult):
            view.setTextToDigitsLabel(text: successResult)
        case .failure(let errorResult):
            router.showErrorAlert(with: errorResult)
        }
    }
    
}
