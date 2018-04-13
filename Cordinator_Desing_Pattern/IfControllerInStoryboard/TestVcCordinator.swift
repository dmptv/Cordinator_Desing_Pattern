//
//  TestControllerCorrdinator.swift
//  Cordinator_Desing_Pattern
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class TestVcCordinator: Coordinator {
    private let presenter: UINavigationController
    
    private weak var testViewController: TestViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        let testViewController = TestViewController.instantiateViewController()
        testViewController.title = "Test from Sb"
        presenter.pushViewController(testViewController, animated: true)

        self.testViewController = testViewController
    }
    
    deinit {
        print("\(self)")
    }
}
