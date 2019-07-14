//
//  StackContainerController.swift
//  ViewControllers_demo_8
//
//  Created by Andrew Solovey on 21.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class StackContainerController: UIViewController {
    @IBOutlet var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewController1 = LifeCycleViewController()
        viewController1.view.backgroundColor = UIColor.red
        addInStack(viewController: viewController1)

        let viewController2 = LifeCycleViewController()
        viewController2.view.backgroundColor = UIColor.blue
        addInStack(viewController: viewController2)

        let viewController3 = LifeCycleViewController()
        viewController3.view.backgroundColor = UIColor.green
        addInStack(viewController: viewController3)
    }
    
    func addInStack(viewController: UIViewController) {
        viewController.willMove(toParent: self)
        addChild(viewController)
        stackView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    func removeFromStack(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
        stackView.removeArrangedSubview(viewController.view)
        viewController.didMove(toParent: nil)
    }
}
