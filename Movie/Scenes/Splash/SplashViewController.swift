//
//  ViewController.swift
//  Movie
//
//  Created by Mert on 20.02.2024.
//

import UIKit
import FirebaseRemoteConfig
import SnapKit

final class SplashViewController: UIViewController {
    
    var presenter: ISplashPresenter?
    private let loodosLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(loodosLabel)
        loodosLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension SplashViewController: ISplashView {
    
    func setLoodosLabelText(_ text: String) {
        loodosLabel.text = text
    }
    
    func handleAlert(message: String) {
        showAlert(title: "Ops!", message: message)
    }
}
