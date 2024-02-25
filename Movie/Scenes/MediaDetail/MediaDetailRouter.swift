//
//  MediaDetailRouter.swift
//  Movie
//
//  Created by Mert on 25.02.2024.
//

import Foundation
import UIKit

final class MediaDetailRouter {
    
    weak var view: UIViewController?
    
    static func setupModule(media: Media) -> MediaDetailViewController {
        let viewController = MediaDetailViewController()
        let presenter = MediaDetailPresenter()
        let router = MediaDetailRouter()
        let interactor = MediaDetailInteractor()
        
        viewController.presenter = presenter
        viewController.media = media
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension MediaDetailRouter: IMediaDetailRouter {
    
}
