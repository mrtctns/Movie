//
//  MediaDetailPresenter.swift
//  Movie
//
//  Created by Mert on 25.02.2024.
//

import Foundation

final class MediaDetailPresenter {
    
    var view: IMediaDetailViewController?
    var interactor: IMediaDetailInteractor?
    var router: IMediaDetailRouter?
}

extension MediaDetailPresenter: IMediaDetailPresenter {
    
}

extension MediaDetailPresenter: IMediaDetailInteractorToPresenter {
    
}
