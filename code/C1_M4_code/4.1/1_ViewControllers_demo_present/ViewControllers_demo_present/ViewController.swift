//
//  ViewController.swift
//  ViewControllers_demo_present
//
//  Created by Andrew Solovey on 15.04.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showSecondViewController(_ sender: Any) {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true, completion: nil)
    }
}
