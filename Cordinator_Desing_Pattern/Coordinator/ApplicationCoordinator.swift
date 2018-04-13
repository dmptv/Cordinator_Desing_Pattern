

import UIKit

class ApplicationCoordinator: Coordinator {
    // injections
    let kanjiStorage: KanjiStorage
    let rootViewController: UINavigationController
    
    let window: UIWindow
    let allKanjiListCoordinator: AllKanjiListCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        kanjiStorage = KanjiStorage()
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        allKanjiListCoordinator = AllKanjiListCoordinator(presenter: rootViewController,
                                                          kanjiStorage: kanjiStorage)
    }
    
    public func start() {
        // where things kick off
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        allKanjiListCoordinator?.start()
    }
    
}
