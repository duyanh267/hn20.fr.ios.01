//
//  TypeDateTableViewCell.swift
//  iOSBasic.Example.Day4.AnhND47
//
//  Created by Nguyen Duy anh on 4/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

protocol TypeDateCellDelegate {
    func changedSwitchItem(checked: Int, state: Bool)
}

class TypeDateCell: UITableViewCell {
    var delegate: TypeDateCellDelegate?
    
    var checked: Int?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func changedSwitch(_ sender: UISwitch) {
        if let checked = checked {
            delegate?.changedSwitchItem(checked: checked, state: itemSwitch.isOn)
        }
    }
    
}
