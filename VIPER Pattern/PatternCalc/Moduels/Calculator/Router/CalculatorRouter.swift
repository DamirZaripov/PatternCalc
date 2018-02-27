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
    weak var view: UIViewController?
    
    func showAlert(alert: UIViewController) {
        view?.present(alert, animated: true, completion: nil)
    }
}
