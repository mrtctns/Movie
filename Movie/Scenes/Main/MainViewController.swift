//
//  MainViewController.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import UIKit
import Alamofire
import FirebaseAnalytics

final class MainViewController: UIViewController {
    
    var presenter: IMainPresenter?
    var adapter: MainAdapter?

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Film adı girin..."
        searchBar.barTintColor = .black
        return searchBar
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "Loodos Movie"
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    private func setupUI() {
        tableView.delegate = adapter
        tableView.dataSource = adapter

        searchBar.delegate = adapter
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }

        view.addSubview(tableView)
        tableView.register(MediaCell.self, forCellReuseIdentifier: MediaCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}



extension MainViewController: IMainView {
    
    func tableViewReload() {
        tableView.reloadData()
    }
    
    func handleAlert(message: String) {
        showAlert(title: "Ops!", message: message)
    }
}
