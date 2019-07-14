//
//  SecondViewController.swift
//  ViewControllers_demo_7
//
//  Created by Andrew Solovey on 19.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = text
        
    }
}
