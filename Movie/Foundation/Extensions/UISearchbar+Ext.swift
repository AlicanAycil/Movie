//
//  UISearchbar+Ext.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        
        if let searchTextfield = self.value(forKey: "searchField") as? UITextField  {
            return searchTextfield
        }
        return nil
    }
    
    var cancelButton : UIButton? {
        if let button = self.value(forKey: "cancelButton") as? UIButton  {
            return button
        }
        return nil
    }
}
