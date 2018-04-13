


import UIKit

protocol KanjiListViewControllerDelegate: class {
    func kanjiListViewControllerDidSelectKanji(_ selectedKanji: Kanji)
    func KanjiListViewControllerBarBtnTapped()
}

class KanjiListViewController: UIViewController {
    
    weak var delegate: KanjiListViewControllerDelegate?
    
    @IBOutlet weak var kanjiListTableView: UITableView! {
        didSet {
            kanjiListTableView?.dataSource = self
            kanjiListTableView?.delegate = self
        }
    }
    
    // data source
    var kanjiList: [Kanji] = [] {
        didSet {
            DispatchQueue.main.async {
                self.kanjiListTableView?.reloadData()
            }
        }
    }
    
    var cellAccessoryType = UITableViewCellAccessoryType.disclosureIndicator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openVCFromStoryboard))
    }
    
    @objc private func openVCFromStoryboard() {
        delegate?.KanjiListViewControllerBarBtnTapped()
        
    }
    
    deinit {
        print("\(self)")
    }
}

extension KanjiListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kanjiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "ListItem") {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ListItem")
        }
        let kanji = kanjiList[indexPath.row]
        cell.textLabel?.text = kanji.character
        cell.detailTextLabel?.text = kanji.meaning
        cell.accessoryType = cellAccessoryType
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        
        let kanji = kanjiList[indexPath.row]
        delegate?.kanjiListViewControllerDidSelectKanji(kanji)
    }
    
    
}











