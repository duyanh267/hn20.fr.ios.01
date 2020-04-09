//
//  ContactViewCell.swift
//  Example.Day6.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/9/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {

    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var phoneTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData(name: String, phone: String) {
        nameTextLabel.text = name
        phoneTextLabel.text = phone
    }
}
