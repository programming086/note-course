//
//  SecondViewController.swift
//  ViewControllers_demo_tab
//
//  Created by Andrew Solovey on 15.04.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second view controller"
    }
    
    @IBAction func buttonCloseClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showRateTab() {
        tabBarController?.selectedIndex = 1
    }
}
