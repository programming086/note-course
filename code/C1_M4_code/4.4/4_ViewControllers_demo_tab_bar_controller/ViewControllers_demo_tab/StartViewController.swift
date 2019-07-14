//
//  StartViewController.swift
//  ViewControllers_demo_tab
//
//  Created by Andrew Solovey on 19.04.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First screen"
    }
    
    @IBAction func buttonPushClicked(_ sender: Any) {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
