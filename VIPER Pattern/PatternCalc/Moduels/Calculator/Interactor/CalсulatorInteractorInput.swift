//
//  CalculatorInteractorInput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Input protocol for Calculator Interactor
protocol CalсulatorInteractorInput: class{
    
    /// Counting a single operation
    ///
    /// - Parameters:
    ///   - digitsLabelText: value
    ///   - operation: name of operation
    func calculateSingleOperation(value digitsLabelText: String, operationTitle operation: String)
    
    /// Counting a multiplay operation
    ///
    /// - Parameter digitsLabelText: second value
    func calculateMultiPlayOpetaion(value digitsLabelText: String)
    
    /// Memorizing a multiplay operation
    ///
    /// - Parameters:
    ///   - digitsLabelText: first value
    ///   - operation: name of operation
    func toSetMuptiplayOpertaion(value digitsLabelText: String, operationTitle operation: String)
    
    ///
    ///
    /// - Parameters:
    ///   - numberTitle: new number
    ///   - digitsLabelText: current number on device
    func processingOfClickDigitButton(with numberTitle: String, and digitsLabelText: String)
    
    /// Assignment to zero
    func processingOfClearButton()
    
    /// Сomma treatment
    ///
    /// - Parameter digitsLabelText: current value
    func processingOfCommaButton(with digitsLabelText: String)
}
