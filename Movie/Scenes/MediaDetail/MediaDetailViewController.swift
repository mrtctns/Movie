//
//  MediaDetailViewController.swift
//  Movie
//
//  Created by Mert on 25.02.2024.
//

import UIKit
import Kingfisher

final class MediaDetailViewController: UIViewController {
    
    var presenter: IMediaDetailPresenter?
    var media: Media?
    
    // Arayüz öğeleri
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI(){
        view.backgroundColor = .black
        
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(yearLabel)
        view.addSubview(typeLabel)
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(yearLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }
        guard let media else { return }
        titleLabel.text = media.title
        yearLabel.text = "Year: \(media.year ?? "")"
        typeLabel.text = "Type: \(media.type ?? "")"
        posterImageView.kf.setImage(with: URL(string: media.poster ?? ""))
    }
}

extension MediaDetailViewController: IMediaDetailViewController {
    
}
