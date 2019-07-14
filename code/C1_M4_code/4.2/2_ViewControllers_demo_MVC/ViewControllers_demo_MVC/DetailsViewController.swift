//
//  DetailsViewController.swift
//  ViewControllers_demo_MVC
//
//  Created by Andrew Solovey on 19.05.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let addressBook: AddressBook
    var contact: Contact

    init(addressBook: AddressBook, contact: Contact) {
        self.addressBook = addressBook
        self.contact = contact
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Ссылки на графические элементы
    // @IBOutlet var nameTextField: UITextField!
    // @IBOutlet var photoImageView: UIImageView!
    // ... ссылки на другие элементы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Тут показываем содержимое объекта contact
        // self.photoImageView.image = contact.photo
        // ... и так далее
        self.nameTextField.text = contact.name
        self.phoneTextField.text = contact.phone
        self.addressTextField.text = contact.address
    }

    @IBAction func saveAndClose() {
        if let index = addressBook.contacts.index(where: { $0.id == contact.id }) {
            // Обновляем существующий контакт
            addressBook.contacts[index] = contact
        } else {
            // Нет существующего? - добавляем новый
            addressBook.contacts.append(contact)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func cancelClicked() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func nameChanged(_ sender: UITextField) {
        updateName(sender.text ?? "")
    }
    
    @IBAction func phoneChanged(_ sender: UITextField) {
        updatePhone(sender.text ?? "")
    }
    
    @IBAction func addressChanged(_ sender: UITextField) {
        updateAddress(sender.text ?? "")
    }
}

// MARK: - Обновление данных
extension DetailsViewController {
    func updateName(_ name: String) {
        contact.name = name
    }
    
    func updatePhone(_ phone: String) {
        contact.phone = phone
    }
    
    func updateAddress(_ address: String) {
        contact.address = address
    }
}
