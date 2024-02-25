//
//  UIViewController+Extensions.swift
//  Movie
//
//  Created by Mert on 21.02.2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(
            title: String?,
            message: String?,
            buttonTitles: [String]? = nil,
            highlightedButtonIndex: Int? = nil,
            completion: ((Int) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.isEmpty {
            allButtons.append("Tamam")
        }

        for (index, buttonTitle) in allButtons.enumerated() {
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
                completion?(index)
            })
            alertController.addAction(action)
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                alertController.preferredAction = action
            }
        }
        present(alertController, animated: true, completion: nil)
    }
}
