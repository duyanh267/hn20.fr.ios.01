//
//  MainViewController.swift
//  iOSBasic.Day8.AnhND47
//
//  Created by AnhND on 4/13/20.
//  Copyright © 2020 AnhND47. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TableView DataSource
extension MainViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "TouchEvents"
        } else {
            cell.textLabel?.text = "Gesture Recognizer"
        }
        return cell
    }
    
}

// MARK: - TableView Delegate
extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            pushToTouchEventsView()
        } else {
            pushToGestureRecognizerView()
        }
    }
    
    private func pushToTouchEventsView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let touchEventVC = storyboard.instantiateViewController(withIdentifier: "TouchEventsViewController") as? TouchEventsViewController else { return }
        navigationController?.pushViewController(touchEventVC, animated: true)
    }
    
    private func pushToGestureRecognizerView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let gestureVC = storyboard.instantiateViewController(withIdentifier: "GesturesViewController") as? GesturesViewController else { return }
        navigationController?.pushViewController(gestureVC, animated: true)
    }
}
