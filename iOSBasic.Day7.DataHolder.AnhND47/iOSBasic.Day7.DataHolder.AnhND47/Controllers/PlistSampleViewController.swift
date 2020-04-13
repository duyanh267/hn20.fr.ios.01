//
//  PlistSampleViewController.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/10/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class PlistSampleViewController: UIViewController {
    @IBOutlet private weak var keyLabel: UILabel!
    @IBOutlet private weak var valueTextField: UITextField!
    
    private var plistData: Dictionary<String, AnyObject>?
    private var plistManager = PlistManager()
    private var infoData = Infodata()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask	))
        title = "Plist sample"
        let data = getDataByDecodable(withName: "PropertyListSample.plist")
        displayDataFromPlistFile(data)
    }
    
}

extension PlistSampleViewController {
    private func getDataFromFilePlistFile(_ name: String) -> Dictionary<String, AnyObject>? {
        if let data = plistManager.getPlist(withName: name)?.first {
            return data
        }
        return nil
    }
    // TODO: writing plist data as entity
    private func displayDataFromPlistFile(_ data: Infodata?) {
        guard let data = data else {
            keyLabel.text = "No data"
            valueTextField.text = "No data"
            return
        }
        print(data)
        keyLabel.text = "Class"
        if let className = data.isClass {
            valueTextField.text = "\(className)"
        } else {
            valueTextField.text = "No data"
        }
        
    }
    
    @IBAction private func invokeButtonSave(_ sender: UIButton) {
        saveData(valueTextField.text ?? "Woop, no data", to: "PropertyListSample")
    }
    
    private func saveData(_ saveData: String, to file: String) {
        infoData.isClass = saveData
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PropertyListSample.plist")
        let enconder = PropertyListEncoder()
        do {
            let encoded = try enconder.encode(self.infoData)
            try encoded.write(to: path)
        } catch {
            print("Error encoding data")
        }
    }
    
    func getDataByDecodable(withName name: String) -> Infodata? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PropertyListSample.plist")
        if let data = try? Data(contentsOf: path) {
            let decoded = PropertyListDecoder()
            do {
                infoData = try decoded.decode(Infodata.self, from: data)
                return infoData
            } catch {
                print(error)
                return nil
            }
        }
        return nil
    }
}
