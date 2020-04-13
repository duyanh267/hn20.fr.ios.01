//
//  KeyChainWrapper.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/12/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation

protocol KeychainWrapperProtocol: class {
    func saveData(key: String, value: String) -> Bool
    func loadData(key: String) -> String?
    func deleteData(key: String) -> Bool
}


class KeyChainWrapper {
    
}

extension KeyChainWrapper: KeychainWrapperProtocol {
    func saveData(key: String, value: String) -> Bool {

        return true
    }
    
    func loadData(key: String) -> String? {
        
        return ""
    }
    
    func deleteData(key: String) -> Bool {

        return true
    }
    
    
}
