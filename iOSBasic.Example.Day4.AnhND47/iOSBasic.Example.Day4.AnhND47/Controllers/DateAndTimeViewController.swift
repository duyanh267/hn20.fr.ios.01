//
//  DateAndTimeViewController.swift
//  iOSBasic.Example.Day4.AnhND47
//
//  Created by Nguyen Duy anh on 4/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//
import UIKit

class DateAndTimeViewController: UIViewController {

    private var checkSwitch: Bool = true
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
        tableView.separatorStyle = .none

        tableView.register(UINib.init(nibName: "TypeDateCell", bundle: nil), forCellReuseIdentifier: "typeDateCell")
        tableView.register(UINib.init(nibName: "AutomaticCell", bundle: nil), forCellReuseIdentifier: "automaticCell")
        tableView.register(UINib.init(nibName: "DateTimeCell", bundle: nil), forCellReuseIdentifier: "dateTimeCell")
        
        dateTimePicker.datePickerMode = .dateAndTime
        dateTimePicker.isHidden = true
    }
    
    @IBAction func changedDateTime(_ sender: UIDatePicker) {
        tableView.reloadRows(at: [IndexPath(row: 2, section: 1)], with: .automatic)
    }
}

// MARK: - UITableView DataSource
extension DateAndTimeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "typeDateCell", for: indexPath) as? TypeDateCell else {  fatalError() }
            if indexPath.section == 0 {
                cell.checked = 0
                cell.titleLabel.text = "24-Hour Time"
                cell.delegate = self
            } else if indexPath.section == 1 {
                cell.checked = 1
                cell.titleLabel.text = "Set Automatically"
                cell.itemSwitch.isOn = checkSwitch
                cell.delegate = self
                
            }
            return cell
        } else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "automaticCell", for: indexPath) as? AutomaticCell else { fatalError() }
            cell.timeZoneLabel.text = "Time Zone"
            cell.areaLabel.text = "Ha Noi"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dateTimeCell", for: indexPath) as? DateTimeCell else { return UITableViewCell() }
            dateFormatter.dateFormat = "dd-MM-yyyy"
            cell.dateLabel.text = dateFormatter.string(from: dateTimePicker.date)
            dateFormatter.dateFormat = "HH:mm"
            cell.hourLabel.text = dateFormatter.string(from: dateTimePicker.date)
            cell.isHidden = checkSwitch
            cell.tag = 19
            return cell
        }
            
    }
}
    
   


// MARK: - UITableView DataSource
extension DateAndTimeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            dateTimePicker.isHidden = !dateTimePicker.isHidden
        }
    }
}

extension DateAndTimeViewController: TypeDateCellDelegate {
    func changedSwitchItem(checked: Int, state: Bool) {
        if checked == 0 {
            if state == true {
                print("Turn on")
            } else {
                print("Turn off")
            }
        } else if checked == 1 {
            checkSwitch = state
            tableView.viewWithTag(19)?.isHidden = state
        }
    }
}


