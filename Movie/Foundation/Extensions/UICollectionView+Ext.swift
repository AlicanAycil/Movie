//
//  UITableView+Ext.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableLayoutableCell(withIdentifier: String, indexPath: IndexPath) -> UICollectionViewCell? {
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: withIdentifier, for: indexPath)
        guard let layoutableCell = cell as? LayoutableCollectionViewCell  else {
            return cell
        }
        layoutableCell.setupViews()
        layoutableCell.setupLayout()
        return layoutableCell
    }
    
    func setEmptyStateMessage() {
        
        let messageLabel = UILabel(frame: CGRect(x: 20,
                                                 y: 20,
                                                 width: self.bounds.size.width-40,
                                                 height: self.bounds.size.height-40))
        messageLabel.text = "Nothing to show :("
        messageLabel.textColor = UIColor.lightGray.withAlphaComponent(0.5)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
    
    func removeEmptyStateMessage() {
        self.backgroundView = nil
    }
}
