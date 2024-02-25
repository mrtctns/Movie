//
//  SplashContract.swift
//  Movie
//
//  Created by Mert on 20.02.2024.
//

import Foundation

protocol ISplashView: AnyObject {
    func handleAlert(message: String)
    func setLoodosLabelText(_ text: String)
}

protocol ISplashPresenter: AnyObject {
    func viewDidLoad()
}

protocol ISplashInteractor: AnyObject {
    func remoteConfigConfigure()
    func checkNetworkStatus()
}

protocol ISplashInteractorToPresenter: AnyObject {
    func splashTextFetched(text: String)
    func showError(message: String)
    func networkConnected()
}

protocol ISplashRouter: AnyObject {
    func navigateToMain()
}
