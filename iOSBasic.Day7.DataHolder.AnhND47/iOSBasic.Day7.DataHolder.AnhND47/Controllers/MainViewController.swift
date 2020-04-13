//
//  ViewController.swift
//  iOSBasic.Day7.DataHolder.AnhND47
//
//  Created by Nguyen Duy anh on 4/10/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private enum MainViewCell: Int {
        case plistSample = 0
        case userDefaultSample
        case imageDocumentDirectory
        case nsKeyedArchiver
        case mainViewCellCount
       
    }
    @IBOutlet private weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView(mainTableView)
    }
}

extension MainViewController {
    private func setupTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(red: 0.6392156863, green: 0.2980392157, blue: 0.2705882353, alpha: 1)
    }
    
    private func pushViewControllerWithEnum(_ enumType: MainViewCell) {
        switch enumType {
        case .plistSample:
            performSegue(withIdentifier: "MainToPlist", sender: self)
        case .userDefaultSample:
            performSegue(withIdentifier: "MainToUserDefault", sender: self)
        case .imageDocumentDirectory:
            performSegue(withIdentifier: "MainToImageFileManager", sender: self)
        case .nsKeyedArchiver:
            performSegue(withIdentifier: "MainToKeyChainView", sender: self)
        default:
            break
        }
        
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellType = MainViewCell(rawValue: indexPath.row) {
            pushViewControllerWithEnum(cellType)
        } else {
            print("Error - index out of bounds")
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewCell.mainViewCellCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        if let enumValue = MainViewCell(rawValue: indexPath.row) {
            cell.textLabel?.text = "\(enumValue)"
        } else {
            cell.textLabel?.text = "Wrong value for index \(indexPath)"
        }
        return cell
    }
}
