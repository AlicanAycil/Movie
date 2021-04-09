//
//  Layouting.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

protocol Layouting {

    associatedtype ViewType = UIView & Layoutable

    var layoutableView: ViewType { get }

}

extension Layouting where Self: UIViewController {

    var layoutableView: ViewType {
        
        guard let aView = view as? ViewType else {
            fatalError("LayoutableView has not been initialized yet, or not initialized as \(ViewType.self).")
        }
        return aView
    }
}

typealias LayoutingViewController = UIViewController & Layouting
