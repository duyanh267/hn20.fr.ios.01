//
//  ViewController.swift
//  01.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/1/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var translateButton: UIButton!
    @IBOutlet private weak var languagePickerView: UIPickerView!
    @IBOutlet weak var displayLabel: UILabel!
    
    private var rowHeight: CGFloat = 40.0
    private var saveValueString: String = ""
    private var saveKeyString: [String] = [String]()
    private var pickerData: [String: String] = [
        "English": "Hello World!",
        "Japanese": "こんにちは世界!",
        "Vietnamese": "Chào Thế Giới",
        "Korean": "안녕하세요 월드",
        "Russian": "Привет, мир",
        "German": "Hallo Welt",
        "Italian": "Ciao mondo",
        "Hindi": "नमस्ते दुनिया",
        "French": "Bonjour le monde",
        "Greek": "Γειά σου Κόσμε",
        "Czech": "Ahoj světe",
        "Spanish": "Hola Mundo",
        "Portuguese": "Olá Mundo",
        "Dutch": "Hallo Wereld",
        "Hebrew": "שלום עולם",
        "Hungarian": "Helló Világ",
        "Croatian": "Pozdrav svijete",
        "Ukrainian": "Привіт Світ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languagePickerView.delegate = self
        languagePickerView.dataSource = self
        customElement()
        for(key, _) in pickerData {
            saveKeyString.append(key)
        }
    
    }
    
    func customElement() {
        translateButton.layer.cornerRadius = 15
        translateButton.clipsToBounds = true
    }
    
    @IBAction func translateButtonPressed(_ sender: UIButton) {
        displayLabel.text = pickerData[saveValueString]
    }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return saveKeyString[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveValueString = saveKeyString[row]
    }
}// End ViewController
