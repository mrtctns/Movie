//
//  MainInteractor.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import Foundation
import Alamofire

final class MainInteractor {
    var output: IMainInteractorToPresenter?
    private var baseURL = "https://www.omdbapi.com"
    private var apiKey = "fbf23f83"
}

extension MainInteractor: IMainInteractor {
    func getMedias(searchText: String, page: Int) {
        ActivityIndicatorManager.shared.showActivityIndicator()
        AF.request("\(baseURL)/?apikey=\(apiKey)&s=\(searchText)&page=\(page)", method: .get).responseDecodable(of: SearchResult.self) { response in
            ActivityIndicatorManager.shared.hideActivityIndicator()
            switch response.result {
            case .success(let film):
                self.output?.mediaReceived(mediaArr: film.search)
            case .failure(let error):
                self.output?.showError(message: "Lütfen daha sonra tekrar deneyin error: \(error)")
            }
        }
    }
}
