//
//  CalculatorViewOutput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

protocol CalculatorViewOutput{
    func onNumbersButtonPressed(with numberTitle: String, and digitsLabelText: String)
    func onCommaButtonPressed(with digitsLabelText: String)
    func onClearButtonPressed()
    func onSingleOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String)
    func onMultiplayOperationButtonPressed(value digitsLabelText: String, operationTitle operation: String)
    func onEqullyButtonPressed(value digitsLabelText: String)
}
