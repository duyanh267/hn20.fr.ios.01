//
//  AutomaticCell.swift
//  iOSBasic.Example.Day4.AnhND47
//
//  Created by Nguyen Duy anh on 4/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class AutomaticCell: UITableViewCell {

    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
