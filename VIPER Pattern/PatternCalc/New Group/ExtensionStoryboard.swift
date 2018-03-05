//
//  ExtensionStoryboard.swift
//  PatternCalc
//
//  Created by Damir Zaripov on 06.03.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        case main
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
}
