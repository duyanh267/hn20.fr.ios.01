//
//  CustomAnimation.swift
//  Example.iOSBasic.Day3.AnhND47
//
//  Created by Nguyen Duy anh on 4/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let goToViewController = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(goToViewController.view)
        goToViewController.view.alpha = 0
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            goToViewController.view.alpha = 1
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
