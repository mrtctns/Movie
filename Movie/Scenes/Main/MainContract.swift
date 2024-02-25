//
//  MainContract.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import Foundation

protocol IMainView: AnyObject {
    func handleAlert(message: String)
    func tableViewReload()
}

protocol IMainPresenter: AnyObject {
    func sendRequest(searchText: String)
    func getMediaResults() -> [Media]
    func loadNextPage()
}

protocol IMainInteractor: AnyObject {
    func getMedias(searchText: String, page: Int)
}

protocol IMainInteractorToPresenter: AnyObject {
    func showError(message: String)
    func mediaReceived(mediaArr: [Media]?)
}

protocol IMainRouter: AnyObject {
    func navigateToMediaDetail(media: Media)
}

protocol IMainDelegate: AnyObject {
    func pushMediaDetailVC(media: Media)
}
