//
//  UIViewController+Ext.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

extension UIViewController {
    
    func presentAlertMessage(message: String){
        
        let alert = UIAlertController(title: message,
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
