//
//  ViewController.swift
//  ExDay2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/3/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculator = CalculatorLogic()
    private var isFinishTypingNumber : Bool = true
    private var displayValue: Double {
        get {
            guard let value = displayLabel.text else { fatalError("Cannot unwrapping to a display label text")}
            guard let convertNumberDouble = Double(value) else {fatalError("Cannnot convert label text to a Double")}
            return convertNumberDouble
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
  
    @IBOutlet private var operatorOfButtons: [UIButton]!
    @IBOutlet private var utilityOfButtons: [UIButton]!
    @IBOutlet private var numberOfButtons: [UIButton]!
    
    @IBOutlet private weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Operators of Calculator
    @IBAction func calculatorPreesed(_ sender: UIButton) {
        isFinishTypingNumber = true
        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(element: calcMethod) {
                displayValue = result
            }
        }
    }

    // MARK: - Display on the Label text
    @IBAction func numberOfCalculatePressed(_ sender: UIButton) {
        guard let value = displayLabel.text else { fatalError("Cannot unwrapping to a display label text")}
        if let numberValue = sender.currentTitle {
            if isFinishTypingNumber == true {
                displayLabel.text = numberValue
                isFinishTypingNumber = false
            } else {
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if isInt == false {
                        return
                    }
                }
                displayLabel.text = value + numberValue
            }
        }
    }
}

// MARK: - Change settings UI Theme for calculate
extension ViewController {
    // Vibrant theme
    @IBAction private func customVibrantTheme(_ sender: UIButton) {
           setupVibrantTheme()
    }
    private func setupVibrantTheme() {
        for index in utilityOfButtons {
            index.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.4705882353, blue: 0.7411764706, alpha: 1)
        }
        for element in numberOfButtons {
            element.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        for component in operatorOfButtons {
            component.backgroundColor = #colorLiteral(red: 0.8955077011, green: 0.5277846417, blue: 0.9686274529, alpha: 1)
        }
    }
    
    //Relax theme
    @IBAction private func customRelaxTheme(_ sender: UIButton) {
        setupRelaxTheme()
    }
    
    private func setupRelaxTheme() {
        for index in utilityOfButtons {
            index.backgroundColor = #colorLiteral(red: 0.6392156863, green: 0.2980392157, blue: 0.2705882353, alpha: 1)
        }
        for element in numberOfButtons {
            element.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        for component in operatorOfButtons {
            component.backgroundColor = #colorLiteral(red: 0.3466543847, green: 0.3260769037, blue: 0.9686274529, alpha: 1)
        }
    }
    
    //Dark theme
    @IBAction private func setupDarkTheme(_ sender: UIButton) {
           setupDarkTheme()
    }
    private func setupDarkTheme() {
        for item in utilityOfButtons {
            item.backgroundColor = #colorLiteral(red: 0.6509803922, green: 0.6509803922, blue: 0.6509803922, alpha: 1)
        }
        for element in numberOfButtons {
            element.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
        for component in operatorOfButtons {
            component.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.6705882353, blue: 0.1215686275, alpha: 1)
        }
    }
}
