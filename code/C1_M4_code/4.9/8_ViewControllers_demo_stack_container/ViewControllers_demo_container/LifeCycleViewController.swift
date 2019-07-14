//
//  LifeCycleViewController.swift
//  ViewControllers_demo_8
//
//  Created by Andrew Solovey on 21.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class LifeCycleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad - \(self)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear, animated: \(animated) - \(self)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear, animated: \(animated) - \(self)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear, animated: \(animated) - \(self)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear, animated: \(animated) - \(self)")
    }
}
