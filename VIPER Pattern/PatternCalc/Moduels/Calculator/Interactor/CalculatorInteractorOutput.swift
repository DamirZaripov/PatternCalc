//
//  CalculatorInteractorOutput.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 26.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

protocol CalculatorInteractorOutput: class{
    func didFinishToCountSingleOperation(with result: Double)
    func didFinishToCountMuptiplayOperation(with result: CalculatorResult)
    func didFinishToSetMultiplayOperation()
}
