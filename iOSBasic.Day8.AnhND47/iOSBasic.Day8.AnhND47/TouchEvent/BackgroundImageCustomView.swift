//
//  BackgroundImageCustomView.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class BackgroundImageCustomView: UIImageView {
    private var countTime: Int = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch events: TOUCH BEGAN!")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        countTime += 1
        print("Touch events: TOUCH MOVED \(countTime)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        countTime = 0
        print("Touch events: TOUCH ENDED!")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch events: TOUCH CANCELLED")
    }
}
