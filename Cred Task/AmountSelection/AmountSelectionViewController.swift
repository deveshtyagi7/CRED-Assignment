//
//  AmountSelectionViewController.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit

class AmountSelectionViewController: CollapsibleViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var mainContainerView: TopRoundedCornerView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var buttonView: TopRoundedCornerView!

    // MARK: - Properties
    weak var rootView: CollapsibleStackRootView!

    var isExpanded: Bool! = true
    

    // MARK: -Init

    required init(rootView: CollapsibleStackRootView) {
        super.init(nibName: "AmountSelectionViewController", bundle: nil)
        self.rootView = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction
    @IBAction func didTappedOnHeaderView() {
        isExpanded.toggle()
        self.dismissAbovePresentedViewController()
    }
    
    @IBAction func proceedToNextViewController() {
        isExpanded.toggle()
        let viewControllerToPresent = AmountSelectionViewController(rootView: rootView)
        let presentationSuccess = self.present(viewControllerToPresent: viewControllerToPresent)
        if presentationSuccess == false {
            showAlert(title: "Hurray!", message: "You are all done with this awesome demo") {[weak self] in
                guard let self = self else { return }
                rootView.navigationController?.popViewController(animated: true)
            }
        }
    }
}
