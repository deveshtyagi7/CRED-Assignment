//
//  UIViewController+Extension.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit

extension UIViewController {

    func showAlert(title: String = "Error", message: String, userAction: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            userAction?()
        }
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
}

