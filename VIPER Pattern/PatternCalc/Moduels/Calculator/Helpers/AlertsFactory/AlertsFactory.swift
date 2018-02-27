//
//  AlertsFactory.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 27.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

class AlertsFactory: AlertsFactoryProtocol{
 
    let errorTitle = "Ошибка"
    let okeyButtonText = "Окей"
    
    func getErrorAlert(with message: String) -> UIViewController {
        let alert = createAlert(with: message, and: errorTitle)
        let okeyAction = createAction(title: okeyButtonText)
        alert.addAction(okeyAction)
        return alert
    }
    
    func createAlert(with errorMesage: String, and title: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: errorMesage, preferredStyle: .alert)
        return alertController
    }
    
    func createAction(title: String) -> UIAlertAction {
        let alertAction = UIAlertAction(title: title, style: .default, handler: nil)
        return alertAction
    }

}
