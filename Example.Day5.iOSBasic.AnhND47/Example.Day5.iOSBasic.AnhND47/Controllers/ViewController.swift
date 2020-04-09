//
//  ViewController.swift
//  Example.Day5.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var fullNameView: CustomInfoView!
    @IBOutlet private weak var emailView: CustomInfoView!
    @IBOutlet private weak var phoneNumberView: CustomInfoView!
    @IBOutlet private weak var addressView: CustomInfoView!
    
    @IBOutlet private weak var descriptionTextView: UITextView!
    @IBOutlet private weak var registerButton: UIButton!
    
    private var checkValid: Bool = true
    private var info = Infomation()
    private var female: String = "Nữ"
    private var male: String = "Nam"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        updateUI()
    }
    
    
    // MARK: - Selected Gender
    @IBAction private func selectGenderButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Bạn là", message: "", preferredStyle: .actionSheet)
        let actionMale = UIAlertAction(title: "Nam", style: .default) { (action) in
            self.info.gender = self.male
        }
        let actionFemale = UIAlertAction(title: "Nữ", style: .default) { (action) in
            self.info.gender = self.female
        }
        alert.addAction(actionMale)
        alert.addAction(actionFemale)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Register Infomation
    @IBAction private func registerButtonPressed(_ sender: UIButton) {
        guard let fullName = fullNameView.inputTextField.text,
            let phone = phoneNumberView.inputTextField.text,
            let email = emailView.inputTextField.text,
            let adress = addressView.inputTextField.text,
            let description = descriptionTextView.text else { fatalError("Cannot unwrapping text")}
        if checkValidate(email, phone) == true {
            info.fullName = fullName
            info.phone = Int(phone)
            info.email = email
            info.adress = adress
            info.description = description
            if let name = info.fullName, let phone = info.phone, let email = info.email, let adress = info.adress, let description = info.description, let gender = info.gender {
                //print("Họ tên: \(name)\n Email: \(email)\n SĐT: \(phone))\nĐịa chỉ: \(adress))\nMô tả: \(description)")
                let alert = UIAlertController(title: "Confirm",
                                              message: "Họ tên: \(name)\n Email: \(email)\n SĐT: \(phone))\nĐịa chỉ: \(adress)\nMô tả: \(description)\nGiới tính: \(gender)",
                preferredStyle: .alert)
                let action = UIAlertAction(title: "Đăng ký", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        } else {
            
        }
    }
}

extension ViewController: UITextViewDelegate {
}


// MARK: - Check valid email and phone number
extension ViewController {
    private func checkValidate(_ email: String, _ phone: String) -> Bool {
        if Utilities.isEmailValid(email) == false {
            checkValid = false
            let alert = UIAlertController(title: "Error", message: "Email phải có @ và . Mời nhập lại!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return checkValid
        } else if phone.isNumeric == false {
            checkValid = false
            let alert = UIAlertController(title: "Error", message: "Số DT không được có chữ cái và kí tự đặc biệt", preferredStyle: .alert)
            let action = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return checkValid
        } else {
            checkValid = true
            return checkValid
        }
    }
    
    private func updateUI() {
        fullNameView.titleLabel.text = "Họ tên"
        emailView.titleLabel.text = "Email"
        phoneNumberView.titleLabel.text = "SĐT"
        addressView.titleLabel.text = "Địa chỉ"
        descriptionTextView.layer.cornerRadius = 10
        Utilities.styleFilledButton(registerButton)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
}


extension String {
    var isNumeric: Bool {
        if self.isEmpty {
            return false
        }
        let nums: Set<Character> =  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
