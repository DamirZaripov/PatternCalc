//
//  CalculatorConfiguration.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 25.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

class CalculatorConfigurator {
    
    static func setupModule() -> CalculatorViewController? {
        
        let viewController: CalculatorViewController = UIStoryboard(storyboard: .main).instantiateViewController()

        let presenter = CalculatorPresenter()
        let iteractor = CalculatorInteractor()
        let router = CalculatorRouter()
        let alertFactory = AlertsFactory()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = iteractor
        presenter.router = router
        
        iteractor.presenter = presenter
        
        router.view = viewController
        router.alertsFactory = alertFactory
        
        return viewController
    }

}

