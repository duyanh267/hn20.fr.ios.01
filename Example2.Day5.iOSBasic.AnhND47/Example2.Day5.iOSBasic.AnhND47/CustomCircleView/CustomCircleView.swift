//
//  CustomCircleView.swift
//  Example2.Day5.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/8/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomCircleView: UIView {
    
    private var beziePath = UIBezierPath()
    private var shapeLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var textLayer = CATextLayer()
    private var titleText = CATextLayer()
    
    var progress: CGFloat = 0 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
            textLayer.string = timeFormatted(Int(progress))
            progressLayer.strokeEnd = progress
            if progress == 0 {
                textLayer.string = "End"
            }
        }
    }
    override func draw(_ rect: CGRect) {
        self.createCirclePath()
        self.creatTimeLabel()
    }
    
    private func createCirclePath() {
        let x = bounds.midX
        let y = bounds.midY
        let center = CGPoint(x: x, y: y)
        
        beziePath.addArc(withCenter: center, radius: 167, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = beziePath.cgPath
        
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = #colorLiteral(red: 0.4610604048, green: 0.5130246282, blue: 0.5630480647, alpha: 1)
        
        progressLayer.path = beziePath.cgPath
        progressLayer.lineWidth = 20
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.fillColor = nil
        progressLayer.strokeColor = #colorLiteral(red: 0.7166367173, green: 0.9197335839, blue: 0.5048458576, alpha: 1)
        
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
    
    private func creatTimeLabel() {
        textLayer.string = "00:01:18"
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.foregroundColor = #colorLiteral(red: 0.7166367173, green: 0.9197335839, blue: 0.5048458576, alpha: 1).cgColor
        textLayer.fontSize = CGFloat(40)
        textLayer.alignmentMode = .center
        textLayer.frame = CGRect(x: 89, y: 143, width: 156, height: 48)
        self.layer.addSublayer(textLayer)
        
        titleText.string = "in progress"
        titleText.backgroundColor = UIColor.clear.cgColor
        titleText.foregroundColor = #colorLiteral(red: 0.7166367173, green: 0.9197335839, blue: 0.5048458576, alpha: 1).cgColor
        titleText.fontSize = CGFloat(17)
        titleText.frame = CGRect(x: 124, y: 199, width: 90, height: 21)
        self.layer.addSublayer(titleText)
    }
    
    private func updateProgressTime() {
        textLayer.string = timeFormatted(Int(progress))
        progressLayer.strokeEnd = progress / 100
        if progress == 0 {
            textLayer.string = "End"
        }
    }
    
    func timeFormatted(_ totalTime: Int) -> String {
        let minutes: Int = totalTime % 60
        let seconds: Int = (totalTime / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
