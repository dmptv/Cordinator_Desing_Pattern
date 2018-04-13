//
//  Extension_for_Storyboard.swift
//  Cordinator_Desing_Pattern
//
//  Created by 123 on 13.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

// If you like storyboards, you can create this protocol

protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype MyType
    static var defaultFileName: String { get }
    static func instantiateViewController(_ bundle: Bundle?) -> MyType
}

extension StoryboardInstantiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = defaultFileName
        let sb = UIStoryboard(name: fileName, bundle: bundle)
        return sb.instantiateInitialViewController() as! Self
    }
}
