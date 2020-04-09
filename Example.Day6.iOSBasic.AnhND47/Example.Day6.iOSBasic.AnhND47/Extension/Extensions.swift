//
//  Extensions.swift
//  Example.Day6.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/9/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.05
        pulse.fromValue = 0.9
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
}
