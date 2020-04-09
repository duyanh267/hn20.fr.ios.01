//
//  CustomNavigationSearch.swift
//  Example.Day6.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/9/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

protocol CustomNavigationSearchDelegate {
    func addActionSearchBarButton()
}

class CustomNavigationSearch: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var searchNavigationBar: UIBarButtonItem!
    
    var delegate: CustomNavigationSearchDelegate?
    private var nibName: String = "CustomNavigationSearch"
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    @IBAction func actionSearchBarButton(_ sender: UIBarButtonItem) {
        delegate?.addActionSearchBarButton()
    }
    
}
