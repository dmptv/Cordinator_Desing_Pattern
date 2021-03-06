//
//  AppDelegate.swift
//  Cordinator_Desing_Pattern
//
//  Created by 123 on 12.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: ApplicationCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = ApplicationCoordinator(window: window)
        
        self.window = window
        self.applicationCoordinator = applicationCoordinator
        
        // Start applicationCoordinator‘s main presentation.
        applicationCoordinator.start()
        
        return true
    }
}
