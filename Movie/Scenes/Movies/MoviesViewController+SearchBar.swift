//
//  MoviesViewController+SearchBar.swift
//  Movie
//
//  Created by Alican Aycil on 15.01.2021.
//

import UIKit

extension MoviesViewController: UISearchBarDelegate {
      
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        layoutableView.collectionView.reloadData()
    }
}
