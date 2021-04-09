//
//  MovieDetailView.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.
//

import UIKit
import Kingfisher

final class MovieDetailView: LayoutableView {
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var horizontalStackView: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return stackView
    }
    
    private lazy var posterImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var voteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appLightGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    func setupViews() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(posterImageView)
        verticalStackView.addArrangedSubview(addRowToStackView(label: titleLabel))
        verticalStackView.addArrangedSubview(addRowToStackView(label: descriptionLabel))
        verticalStackView.addArrangedSubview(addRowToStackView(label: voteLabel))
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            //scrollView
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            //vertical
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor)
        ])
    }
}

//UIConfigure
extension MovieDetailView {
    
    func configureUI(movieDetailItem: MovieDetailItem) {
        
        if let url = movieDetailItem.posterPath {
            posterImageView.kf.setImage(with: url)
        }
        titleLabel.text = movieDetailItem.title
        descriptionLabel.text = movieDetailItem.overview
        voteLabel.text = movieDetailItem.voteCount
        
    }
    
    private func addRowToStackView(label: UILabel) -> UIStackView {
        let stackView = self.horizontalStackView
        stackView.addArrangedSubview(label)
        return stackView
    }
    
}
