//
//  MoviesViewController+CollectionView.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.
//

import UIKit

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout , UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToMovieDetailViewController(id: movies[indexPath.row].id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOfsetY = scrollView.contentOffset.y
        let distance = scrollView.contentSize.height - scrollView.bounds.height

        guard !LoadingViewUtility.isShowingLoadingView() && contentOfsetY > 0 && distance > 0 && contentOfsetY > distance + 100 else {
            return
        }
        if (layoutableView.searchBar.text ?? "").isEmpty {
            interactor?.fetchPopularMovies()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch listType {
        case .grid:
            let width = (UIScreen.main.bounds.width/2 - 8)
            return CGSize(width: width, height: width)
        case .list:
            let width = (UIScreen.main.bounds.width - 16)
            return CGSize(width: width, height: width/2)
        
        }
        

    }
}

extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if movies.count == 0 {
            layoutableView.collectionView.setEmptyStateMessage()
        } else {
            layoutableView.collectionView.removeEmptyStateMessage()
        }
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableLayoutableCell(withIdentifier: "MoviesCollectionViewCell", indexPath: indexPath) as? MoviesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(movieItem: movies[indexPath.row])
        return cell
    }
}
