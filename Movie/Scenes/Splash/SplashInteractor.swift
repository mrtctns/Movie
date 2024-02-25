//
//  SplashInteractor.swift
//  Movie
//
//  Created by Mert on 20.02.2024.
//

import Foundation
import Alamofire
import FirebaseRemoteConfig

final class SplashInteractor {
    
    weak var output: ISplashInteractorToPresenter?
}

extension SplashInteractor: ISplashInteractor {
    
    func checkNetworkStatus() {
        let url = "https://www.apple.com" 
            
        AF.request(url).validate(statusCode: 200..<300).response { response in
            switch response.result {
            case .success:
                self.output?.networkConnected()
            case .failure(let error):
                self.output?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func remoteConfigConfigure() {
        let remote = RemoteConfig.remoteConfig()
        remote.fetch { (status, error) -> Void in
            if status == .success {
                remote.activate()
                if let value = remote.configValue(forKey: "loodosTxt").stringValue {
                    self.output?.splashTextFetched(text: value)
                }
            } else {
                self.output?.showError(message: error?.localizedDescription ?? "İşleminizi şuanda gerçekleştiremiyoruz. Lütfen daha sonra tekrar deneyiniz.")
            }
        }
    }
}
