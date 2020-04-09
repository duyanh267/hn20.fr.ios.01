//
//  CustomComponents.swift
//  Example2.Day5.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomComponents: UIView {
    private var nibName = "CustomComponents"
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var setTimeTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        startButton.layer.cornerRadius = frame.height / 6
    }
}
