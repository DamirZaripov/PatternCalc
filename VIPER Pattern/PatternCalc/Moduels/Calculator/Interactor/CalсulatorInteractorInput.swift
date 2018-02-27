//
//  CalculatorInteractorInput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

protocol CalсulatorInteractorInput: class{
    func toCountSingleOperation(with value: Double, and operation: String)
    func toCountMultiPlayOpetaion(with secondValue: Double)
    func toSetMuptiplayOpertaion(with value: Double, and operation: String)
}
