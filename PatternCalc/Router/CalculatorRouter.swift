//
//  CalculatorRouter.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

class CalculatorRouter {
    
    static func setupModule() -> CalculatorViewController? {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "calculatorView") as! CalculatorViewController
        
        let presenter = CalculatorPresenter(calculatorView: viewController)
        viewController.presenter = presenter
        presenter.calculatorManager = CalculatorManager()
        presenter.singleOperation = SingleOperation()
        presenter.multiplayOperation = MultiplayOperation()
        
        return viewController
    }
}
