//
//  LoadingViewUtility.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

final class LoadingViewUtility {
    
    private static let shared: LoadingViewUtility = LoadingViewUtility()
    private var loadingView: UIView?
    
    static func showLoadingView() {
        
        let indicatorView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: UIScreen.main.bounds.size))
        indicatorView.alpha = 0.3
        indicatorView.backgroundColor = .black
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = CGPoint(x: indicatorView.center.x, y: indicatorView.center.y)
        indicatorView.addSubview(indicator)
        indicator.startAnimating()
        shared.loadingView = indicatorView
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(indicatorView)
        }
    }
    
    static func hideLoadingView() {
        shared.loadingView?.removeFromSuperview()
        shared.loadingView = nil
    }
    
    static func isShowingLoadingView() -> Bool {
        return shared.loadingView != nil
    }
}
