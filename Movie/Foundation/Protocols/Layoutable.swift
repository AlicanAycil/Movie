//
//  Layoutable.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

protocol Layoutable: AnyObject {
    
    func setupViews()
    func setupLayout()
}

extension Layoutable where Self: UIView {

    static func create() -> Self {
        
        let view = Self()
        view.setupViews()
        view.setupLayout()
        return view
    }
}

typealias LayoutableView = UIView & Layoutable
typealias LayoutableCollectionViewCell = UICollectionViewCell & Layoutable
