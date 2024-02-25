//
//  MainPresenter.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import Foundation
import FirebaseAnalytics

final class MainPresenter {
    
    var view: IMainView?
    var interactor: IMainInteractor?
    var router: IMainRouter?
    
    private var page = 1
    private var searchText = String()
    private var mediaArr = [Media]()
}

extension MainPresenter: IMainPresenter {
    
    func loadNextPage() {
        page += 1
        sendRequest(searchText: searchText)
    }
    
    func getMediaResults() -> [Media] {
        mediaArr
    }
    
    func sendRequest(searchText: String) {
        guard searchText == self.searchText else {
            page = 1
            self.searchText = searchText
            mediaArr = []
            interactor?.getMedias(searchText: searchText, page: page)
            return
        }
        interactor?.getMedias(searchText: searchText, page: page)
    }
}

extension MainPresenter: IMainInteractorToPresenter {
    
    func mediaReceived(mediaArr: [Media]?) {
        self.mediaArr += mediaArr ?? []
        view?.tableViewReload()
    }
    
    func showError(message: String) {
        view?.handleAlert(message: message)
    }
}

extension MainPresenter: IMainDelegate {
    
    func pushMediaDetailVC(media: Media) {
        Analytics.logEvent("showMovieDetailClicked", parameters: [:])
        router?.navigateToMediaDetail(media: media)
    }
}
