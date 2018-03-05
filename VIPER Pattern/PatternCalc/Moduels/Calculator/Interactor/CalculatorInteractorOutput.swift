//
//  CalculatorInteractorOutput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

/// Output protocol for Calculator Interactor
protocol CalculatorInteractorOutput: class{
    /// End of work of the Interacor's method
    ///
    /// - Parameter result: result of method
    func didFinishToCountSingleOperation(with result: String)
    
    /// End of work of the Interacor's method
    ///
    /// - Parameter result: result of method
    func didFinishToCountMuptiplayOperation(with result: CalculatorResult)
    
    /// End of work of the Interacor's method
    ///
    /// - Parameter result: result of method
    func didFinishedProcessingOfClickDigitButton(with result: String)
    
    /// End of work of the Interacor's method
    ///
    /// - Parameter result: result of method
    func didFinishedProcessingOfClearButton(with result: String)
    
    /// End of work of the Interacor's method
    ///
    /// - Parameter result: result of method
    func didFinishedProcessingOfCommaButton(with result: String)
}
