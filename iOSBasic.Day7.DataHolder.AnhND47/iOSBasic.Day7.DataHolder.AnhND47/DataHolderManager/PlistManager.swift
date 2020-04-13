//
//  PlistManager.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/10/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation

protocol PlistManagerProtocol {
    func getPlist(withName name: String) -> [Dictionary<String, AnyObject>]?
}

class PlistManager {
    
}

extension PlistManager: PlistManagerProtocol {
    func getPlist(withName name: String) -> [Dictionary<String, AnyObject>]? {
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path) {
            do {
                let plistObject = try PropertyListSerialization.propertyList(from: xml, options: PropertyListSerialization.ReadOptions(), format: nil)
                //print(plistObject)
                if let plistDict = plistObject as? Dictionary<String, AnyObject> {
                    return [plistDict]
                }

                //Cast pListObject - If expected data type is Array of Dict
                if let plistArray = plistObject as? [Dictionary<String, AnyObject>] {
                    return plistArray
                }
            } catch (let error) {
                print(error)
                return nil
            }
        }
        return nil
    }
    
   
}
