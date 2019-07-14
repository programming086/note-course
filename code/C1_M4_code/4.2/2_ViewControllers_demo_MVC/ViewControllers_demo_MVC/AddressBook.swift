//
//  AddressBook.swift
//  ViewControllers_demo_MVC
//
//  Created by Andrew Solovey on 19.05.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import Foundation
import UIKit

class AddressBook {
    var contacts: [Contact] = []
}

struct Contact {
    var id: String
    var name: String
    var phone: String
    var address: String
    var photo: UIImage?
    
    // другие поля
}
