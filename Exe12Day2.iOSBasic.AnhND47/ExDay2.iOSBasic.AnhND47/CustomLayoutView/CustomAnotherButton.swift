//
//  CustomAnotherButton.swift
//  ExDay2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/4/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomAnotherButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = frame.width / 5
        clipsToBounds = true
    }
}
