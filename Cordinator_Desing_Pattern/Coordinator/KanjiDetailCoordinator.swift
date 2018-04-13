//
//  KanjiDetailCoordinator.swift
//  Cordinator_Desing_Pattern
//
//  Created by 123 on 12.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class KanjiDetailCoordinator: Coordinator {
    // injections
    private let presenter: UINavigationController
    private let kanjiStorage: KanjiStorage
    private let kanji: Kanji
    
    private weak var kanjiDetailViewController: KanjiDetailViewController?
    private var wordKanjiListViewController: KanjiListViewController?
  
    init(presenter: UINavigationController, kanji: Kanji, kanjiStorage: KanjiStorage) {
        self.kanji = kanji
        self.presenter = presenter
        self.kanjiStorage = kanjiStorage
    }
    
    func start() {
        let kanjiDetailViewController = KanjiDetailViewController(nibName: nil, bundle: nil)
        kanjiDetailViewController.title = "Kanji details"
        kanjiDetailViewController.selectedKanji = kanji
        kanjiDetailViewController.delegate = self
        presenter.pushViewController(kanjiDetailViewController, animated: true)
        
        self.kanjiDetailViewController = kanjiDetailViewController
    }
    
    deinit {
        print("\(self)")
    }
}


// MARK: - KanjiDetailViewControllerDelegate
extension KanjiDetailCoordinator: KanjiDetailViewControllerDelegate {
    func kanjiDetailViewControllerDidSelectWord(_ word: String) {
        let wordKanjiListViewController = KanjiListViewController(nibName: nil, bundle: nil)
        wordKanjiListViewController.cellAccessoryType = .none
        // networking
        let kanjiForWord = kanjiStorage.kanjiForWord(word)
        wordKanjiListViewController.kanjiList = kanjiForWord
        wordKanjiListViewController.title = word
        
        presenter.pushViewController(wordKanjiListViewController, animated: true)
    }
}










