//
//  CalculatorViewOutput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Output protocol for Calculator View
protocol CalculatorViewOutput{
    
    /// Pressing number button
    ///
    /// - Parameters:
    ///   - numberTitle: number
    ///   - digitsLabelText: current number on device
    func onNumbersButtonPressed(with numberTitle: String, and digitsLabelText: String)
    
    /// Pressing number button
    ///
    /// - Parameter digitsLabelText: current number on device
    func onCommaButtonPressed(with digitsLabelText: String)
   
    /// Pressing number button
    func onClearButtonPressed()
    
    /// Pressing single operation button
    ///
    /// - Parameters:
    ///   - digitsLabelText: current number on device
    ///   - operation: operation name
    func onSingleOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String)
    
    /// Pressing multiplay operation button
    ///
    /// - Parameters:
    ///   - digitsLabelText: current number on device
    ///   - operation: operation name
    func onMultiplayOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String)
    
    /// Pressing eqully button button
    ///
    /// - Parameter digitsLabelText: current number on device
    func onEqullyButtonPressed(value digitsLabelText: String)
}
