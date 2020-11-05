//
//  ContactsController.swift
//  Contacts_App
//
//  Created by Tiffany Obi on 11/5/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class ContactsController: UIViewController {
    
    
    @IBOutlet weak private var contactsTableView: UITableView!
    
    private var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        loadContacts()
    }
    
    private func loadContacts() {
        contacts = Contact.getContacts()
    }


}

extension ContactsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        contactCell.textLabel?.text = contact.fullName
        contactCell.detailTextLabel?.text = "\(contact.phoneNumber)"
        
        return contactCell
    }
    
    
}

extension ContactsController: UITableViewDelegate {
    
}
