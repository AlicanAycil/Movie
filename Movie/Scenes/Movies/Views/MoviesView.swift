//
//  MoviesView.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

final class MoviesView: LayoutableView {
    
    let collectionPadding: CGFloat = 8
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appOrange
        label.text = "Movies"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var listTypeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    lazy var searchButton: UIButton = {
//        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "search"), for: .normal)
//        button.adjustsImageWhenHighlighted = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.backgroundColor = .white
        view.tintColor = .appOrange
        view.textField?.textColor = .gray
        view.textField?.layer.borderWidth = 1
        view.textField?.layer.borderColor = UIColor.gray.cgColor
        view.textField?.layer.cornerRadius = 4
        view.textField?.backgroundColor = .white
//        view.textField?.leftView = searchButton
        view.cancelButton?.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        view.cancelButton?.setTitle("", for: .normal)
        view.backgroundImage = UIImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: frame, collectionViewLayout: collectionViewLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.tag = 101
        return view
    }()
    
    func setupViews() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(listTypeButton)
        addSubview(searchBar)
        addSubview(collectionView)
        collectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCollectionViewCell")

    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            //titleLabel
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //listTypeButton
            listTypeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            listTypeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            listTypeButton.widthAnchor.constraint(equalToConstant: 50),
            listTypeButton.heightAnchor.constraint(equalToConstant: 50),
            
            //searchBar
            searchBar.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            //segmentControl
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: collectionPadding),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -collectionPadding),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}

extension MoviesView {
    
    func setSearchBarCancelButton() {
        searchBar.cancelButton?.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        searchBar.cancelButton?.setTitle(nil, for: .normal)
        searchBar.cancelButton?.adjustsImageWhenHighlighted = false
    }
}

