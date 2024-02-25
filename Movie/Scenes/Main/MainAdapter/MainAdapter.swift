//
//  MainAdapter.swift
//  Movie
//
//  Created by Mert on 25.02.2024.
//

import UIKit
import Alamofire
import Firebase

final class MainAdapter: NSObject {
    private let presenter: IMainPresenter?
    private let delegate: IMainDelegate?
    
    init(presenter: IMainPresenter?, delegate: IMainDelegate) {
        self.presenter = presenter
        self.delegate = delegate
    }
}

extension MainAdapter: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getMediaResults().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaCell.identifier, for: indexPath) as? MediaCell else {
            return UITableViewCell()
        }
        cell.media = presenter?.getMediaResults()[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let media = presenter?.getMediaResults()[indexPath.row] else {return}
        delegate?.pushMediaDetailVC(media: media)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

extension MainAdapter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            presenter?.sendRequest(searchText: searchText)
            searchBar.resignFirstResponder()
        }
    }
}

extension MainAdapter: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            presenter?.loadNextPage()
        }
    }
}
