//
//  NavigationController.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

class NavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setNavigationItems()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNavigationItems() {
        navigationBar.tintColor = UIColor.appOrange
        
        navigationBar.titleTextAttributes =  [
            NSAttributedString.Key.foregroundColor: UIColor.appOrange,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
    }
    
}
