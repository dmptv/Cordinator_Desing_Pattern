

import UIKit

class AllKanjiListCoordinator: Coordinator {
    // injections
    private let presenter: UINavigationController
    private let allKanjiList: [Kanji]
    private let kanjiStorage: KanjiStorage
    
    private var kanjiListViewController: KanjiListViewController?
    private weak var kanjiDetailCoordinator: KanjiDetailCoordinator?
    private weak var testVcCordinator: TestVcCordinator?
    
    init(presenter: UINavigationController, kanjiStorage: KanjiStorage) {
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
        // networking
        allKanjiList = kanjiStorage.allKanji()
    }
    
    public func start() {
        let kanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil)
        kanjiListViewController.title = "Kanji list"
        kanjiListViewController.kanjiList = allKanjiList
        kanjiListViewController.delegate = self
        presenter.pushViewController(kanjiListViewController, animated: true)  
        
        self.kanjiListViewController = kanjiListViewController
    }
    
    deinit {
        print("\(self)")
    }
}

// MARK: - KanjiListViewControllerDelegate
extension AllKanjiListCoordinator: KanjiListViewControllerDelegate {
    func KanjiListViewControllerBarBtnTapped() {
        let testVcCordinator = TestVcCordinator(presenter: presenter)
        testVcCordinator.start()
        
        self.testVcCordinator = testVcCordinator
    }
    
    func kanjiListViewControllerDidSelectKanji(_ selectedKanji: Kanji) {
        let kanjiDetailCoordinator = KanjiDetailCoordinator(presenter: presenter,
                                                            kanji: selectedKanji,
                                                            kanjiStorage: kanjiStorage)
        kanjiDetailCoordinator.start()
        self.kanjiDetailCoordinator = kanjiDetailCoordinator
    }
}








