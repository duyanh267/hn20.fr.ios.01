//
//  InfoData.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/10/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation

class Infodata: Codable {
    var isClass: String?
    var numberOfTrainee: Int?
    var location: String?
    
    private enum CodingKeys: String, CodingKey {
        case isClass = "Class"
        case numberOfTrainee = "Number of trainee"
        case location = "Location"
    }
}
