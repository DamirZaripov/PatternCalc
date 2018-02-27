//
//  CalculatorView.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation

protocol CalсulatorViewInput: class{
    func setTextToDigitsLabel(text: String)
    func showErrorAlert(with message: String)
}
