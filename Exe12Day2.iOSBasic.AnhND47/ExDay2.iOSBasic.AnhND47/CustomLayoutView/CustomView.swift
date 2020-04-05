//
//  CustomView.swift
//  ExDay2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/4/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet private var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initCommon() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
