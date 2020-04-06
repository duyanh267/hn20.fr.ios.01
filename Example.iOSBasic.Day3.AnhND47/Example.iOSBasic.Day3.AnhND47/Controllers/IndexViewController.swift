//
//  IndexViewController.swift
//  Example.iOSBasic.Day3.AnhND47
//
//  Created by Nguyen Duy anh on 4/6/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class IndexViewController: ComonViewController {
    
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var acountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        navigationController?.navigationBar.tintColor = .lightText
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.lightText]
        let imageBackgound = UIImage(named: "naviBackground")
        navigationController?.navigationBar.setBackgroundImage(imageBackgound, for: .default)
    }
    
    @IBAction func goToDetailView(_ sender: UIButton) {
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { fatalError("Error instantiate DetailViewController") }
        //        self.navigationController?.pushViewController(detailVC, animated: true)
        //        detailVC.acount = acountTextField.text
        //        detailVC.fullname = fullnameTextField.text
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.acount = acountTextField.text
            detailVC?.fullname = fullnameTextField.text
        }
    }
}

extension IndexViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return CustomPushAnimation()
        case .pop:
            return CustomPopAnimator()
        default:
            return nil
        }
    }
}
