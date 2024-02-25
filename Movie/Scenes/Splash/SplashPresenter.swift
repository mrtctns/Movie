//
//  SplashPresenter.swift
//  Movie
//
//  Created by Mert on 20.02.2024.
//

import Foundation

final class SplashPresenter {
    
    weak var view: ISplashView?
    var router: ISplashRouter?
    var interactor: ISplashInteractor?
}

extension SplashPresenter: ISplashPresenter {
    
    func viewDidLoad() {
        interactor?.remoteConfigConfigure()
        interactor?.checkNetworkStatus()
    }
}

extension SplashPresenter: ISplashInteractorToPresenter {
    
    func networkConnected() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.router?.navigateToMain()
        }
    }
    
    func showError(message: String) {
        view?.handleAlert(message: message)
    }
    
    func splashTextFetched(text: String) {
        view?.setLoodosLabelText(text)
    }
}
