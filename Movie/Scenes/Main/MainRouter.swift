//
//  MainRouter.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import UIKit

final class MainRouter {
    
    weak var view: UIViewController?
    
    static func setupModule() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter()
        let router = MainRouter()
        let interactor = MainInteractor()
        let adapter = MainAdapter(presenter: presenter, delegate: presenter)
        
        viewController.presenter = presenter
        viewController.adapter = adapter
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension MainRouter: IMainRouter {
    
    func navigateToMediaDetail(media: Media) {
        let destination = MediaDetailRouter.setupModule(media: media)
        view?.navigationController?.pushViewController(destination, animated: true)
    }
}
