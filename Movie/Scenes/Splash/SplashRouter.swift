//
//  SplashRouter.swift
//  Movie
//
//  Created by Mert on 20.02.2024.
//

import UIKit

final class SplashRouter {
    
    weak var view: UIViewController?
    
    static func setupModule() -> SplashViewController {
        let viewController = SplashViewController()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        let interactor = SplashInteractor()
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension SplashRouter: ISplashRouter {
    
    func navigateToMain() {
        let mainVC = MainRouter.setupModule()
        view?.navigationController?.pushViewController(mainVC, animated: true)
    }
}
