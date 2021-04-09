//
//  MoviesTableViewCell.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit
import Kingfisher

final class MoviesCollectionViewCell: LayoutableCollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var alphaBottomView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor =  UIColor.appGray.withAlphaComponent(0.8)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        contentView.isUserInteractionEnabled = true
        backgroundColor = .white
        addSubview(containerView)
        containerView.addSubview(contentImageView)
        containerView.addSubview(alphaBottomView)
        alphaBottomView.addSubview(contentTitle)
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([

            //containerView
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            //contentImageView
            contentImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            //contentTitle
            alphaBottomView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            alphaBottomView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            alphaBottomView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            alphaBottomView.heightAnchor.constraint(equalToConstant: 50),
        
            //contentTitle
            contentTitle.topAnchor.constraint(equalTo: alphaBottomView.topAnchor, constant: 8),
            contentTitle.bottomAnchor.constraint(equalTo: alphaBottomView.bottomAnchor, constant: -8),
            contentTitle.leadingAnchor.constraint(equalTo: alphaBottomView.leadingAnchor, constant: 8),
            contentTitle.trailingAnchor.constraint(equalTo: alphaBottomView.trailingAnchor, constant: -8)
            
        ])
    }
}

extension MoviesCollectionViewCell {
    
    func configure(movieItem: MovieItemCellModel) {
        
        if let url = movieItem.posterFullPath {
            contentImageView.kf.setImage(with: url)
        }
        contentTitle.text = movieItem.title
    }
}
