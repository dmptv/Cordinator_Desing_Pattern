

import Foundation

protocol Coordinator {
    func start()
}

// we should consider memory leaks with children coordinators
