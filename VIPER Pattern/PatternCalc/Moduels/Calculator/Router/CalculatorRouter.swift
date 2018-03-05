//
//  CalculatorRouter.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 24.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

class CalculatorRouter: CalculatorRouterProtocol{
    
    weak var view: UIViewController!
    var alertsFactory: AlertsFactoryProtocol!
    
    func showErrorAlert(with message: String) {
        let errorAlert = alertsFactory.getErrorAlert(with: message)
        view.present(errorAlert, animated: true, completion: nil)
    }
    
}
