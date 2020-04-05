//
//  CustomButton.swift
//  ExDay2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/3/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    private var setValueCornerRadius: CGFloat? {
        get {
            return layer.cornerRadius
        }
        set {
            if let newValue = newValue {
                layer.cornerRadius = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setValueCornerRadius = frame.width / 2
        clipsToBounds = true
    }
}
