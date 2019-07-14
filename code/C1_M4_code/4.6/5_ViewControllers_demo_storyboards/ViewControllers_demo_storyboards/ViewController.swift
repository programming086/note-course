//
//  ViewController.swift
//  ViewControllers_demo_7
//
//  Created by Andrew Solovey on 18.07.2018.
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

    @IBAction func showButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ShowSecondScreen", sender: self)
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? SecondViewController,
            segue.identifier == "ShowSecondScreen" {
            controller.text = "Hello world!"
        }
    }
}

