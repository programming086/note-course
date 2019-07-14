//
//  ViewController.swift
//  ViewControllers_demo_MVC
//
//  Created by Andrew Solovey on 15.04.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    // { .. }
    let addressBook = AddressBook()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressBook.contacts = [
            Contact(id: "1",
                    name: "Chessy Cat",
                    phone: "+8374 94827393",
                    address: "BS 19-45",
                    photo: UIImage(named: "Photo 1")),
            
            Contact(id: "2",
                    name: "Kate Bell",
                    phone: "+776384 48362874",
                    address: "Oxford st. 1-35",
                    photo: UIImage(named: "Photo 2")),
            
            Contact(id: "3",
                    name: "John Appleseed",
                    phone: "(408) 555-0941",
                    address: "1 Infinite Loop, Cupertino",
                    photo: UIImage(named: "Photo 3")),
            
            // Другие контакты
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showAddressBook()
    }
    
    func didTapContact(at index: Int) {
        let contact = addressBook.contacts[index]
        let detailsViewController = DetailsViewController(addressBook: addressBook, contact: contact)
        present(detailsViewController, animated: true, completion: nil)
    }
    
    func showAddressBook() {
        // Тут должна быть логика отображения адресной книги
        tableView.reloadData()
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressBook.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let contact = addressBook.contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapContact(at: indexPath.row)
    }
}
