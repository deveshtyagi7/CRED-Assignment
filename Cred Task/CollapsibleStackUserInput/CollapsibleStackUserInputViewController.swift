//
//  CollapsibleStackUserInputViewController.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit

class CollapsibleStackUserInputViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var textField: UITextField!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction

    @IBAction func proceedButtonPressed(_ sender: Any) {
        if let userInputText = textField.text, let numberOfChildViews = Int(userInputText) {
            guard let collapsibleStackRootViewController = getCollapsibleStackRootViewController(with: numberOfChildViews) else { return }
            navigationController?.pushViewController(collapsibleStackRootViewController, animated: true)
        } else {
            showError("Please enter your input first")
        }
    }

    // MARK: - Helper

    private func showError(_ error: String) {
        showAlert(message: error)
    }

    private func getCollapsibleStackRootViewController(with numberOfChildViews: Int) -> CollapsibleStackRootViewController? {
        do {
            let initialHeight: CGFloat = UIScreen.main.bounds.height * 0.9
            let collapsibleStackRootViewController = try CollapsibleStackRootViewController(maxChildViewsCount: numberOfChildViews,
                                                                                            initialHeight: initialHeight)
            return collapsibleStackRootViewController
        } catch let error as InitializationError {
            showError("\(error.description)")
        } catch {
            showError("An unexpected error occurred: \(error)")
        }
        return nil
    }
    
}
