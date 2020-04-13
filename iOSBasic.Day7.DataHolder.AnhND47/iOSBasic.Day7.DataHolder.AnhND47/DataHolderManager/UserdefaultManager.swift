//
//  UserdefaultManager.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/11/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation

protocol UserDefaultManagerProtocol: AnyObject {
    func saveUserName(_ userName: String) -> Void
    func getUserName() -> String?
}

// UserDefault save data to plist file
class UserDefaultManager {
    let defaults = UserDefaults.standard
}

extension UserDefaultManager: UserDefaultManagerProtocol {
    func saveUserName(_ userName: String) {
        defaults.set(userName, forKey: "UserName")
    }
    
    func getUserName() -> String? {
        return defaults.value(forKey: "UserName") as? String
    }
}
