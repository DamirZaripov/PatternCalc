//
//   AlertsFactoryProtocol.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 27.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import Foundation
import UIKit

protocol AlertsFactoryProtocol: class{
    
    func getErrorAlert(with message: String) -> UIViewController
    
}
