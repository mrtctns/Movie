//
//  ActivityIndicatorManager.swift
//  Movie
//
//  Created by Mert on 26.02.2024.
//

import UIKit

final class ActivityIndicatorManager {
    static let shared = ActivityIndicatorManager()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let viewController = UIViewController()
    
    private init() {
        activityIndicator.center = viewController.view.center
        viewController.view.backgroundColor = .black.withAlphaComponent(0.5)
        viewController.view.addSubview(activityIndicator)
    }
    
    func showActivityIndicator() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.addSubview(viewController.view)
            activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        viewController.view.removeFromSuperview()
    }
}

