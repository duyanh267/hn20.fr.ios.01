//
//  ViewController.swift
//  Example.Day6.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/9/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.

import UIKit

class ContactViewController: UIViewController {
    
    private var contacts = [
        ContactData(name: "Nguyen van a", phone: 1212334567),
        ContactData(name: "Nguyen thi b", phone: 1523152334),
        ContactData(name: "Nguyen thi c", phone: 1231231231),
        ContactData(name: "Nong van dan", phone: 1236531232),
        ContactData(name: "Dao van dat", phone: 1231231231),
        ContactData(name: "Lukaku", phone: 1203981232),
        ContactData(name: "Iron man", phone: 1203988734),
        ContactData(name: "Aquaman", phone: 1231239894),
        ContactData(name: "Cap dat ma an", phone: 1029381645),
        ContactData(name: "Donald trump", phone: 1252398231)
    ]
    
    @IBOutlet weak var contentViewNavigationbar: CustomNavigationSearch!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarView: UIView!
    
    private var searchItem: Bool = false
    private var filterContacts: [ContactData] = [ContactData]()
    var checkHidden: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        contentViewNavigationbar.delegate = self
        tableView.register(UINib(nibName: "ContactViewCell", bundle: nil), forCellReuseIdentifier: "contactViewCell")
        searchBarView.isHidden = true
    }
    
    
}

// MARK: - TableView DataSource
extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchItem == true {
            return self.filterContacts.count
        }
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactViewCell", for: indexPath) as? ContactViewCell else { return UITableViewCell() }
        var contact: ContactData
        if searchItem == true {
            contact = filterContacts[indexPath.row]
        } else {
            contact = contacts[indexPath.row]
        }
        cell.setData(name: contact.name, phone: String(contact.phone))
        return cell
    }
}

extension ContactViewController: CustomNavigationSearchDelegate {
    func addActionSearchBarButton() {
        searchBarView.isHidden = false
    }
}

extension ContactViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        self.tableView.reloadData()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.tableView.reloadData()
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        self.searchBar.showsCancelButton = false
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            searchItem = false
            self.view.endEditing(true)
            self.searchBar.showsCancelButton = false
            self.tableView.reloadData()
        } else {
            searchItem = true
            filterContacts = contacts.filter({ (contact: ContactData) -> Bool in
                contact.name.lowercased().contains(searchText.lowercased())
            })
            self.tableView.reloadData()
        }
    }
}
