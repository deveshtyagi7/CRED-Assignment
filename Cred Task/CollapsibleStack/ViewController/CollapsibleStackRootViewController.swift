//
//  CollapsibleStackRootViewController.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit



class CollapsibleStackRootViewController: CollapsibleStackRootView {

    //MARK: - Properties

    var initialHeight: CGFloat!
    var maxChildViewsCount: Int!

    //MARK: - Init
    required init(maxChildViewsCount: Int, initialHeight: CGFloat) throws {
        super.init(nibName: nil, bundle: nil)
        guard maxChildViewsCount >= 2, maxChildViewsCount <= 4  else {
            throw InitializationError.invalidInput(message: "ChildViewsCount must be in range of 2-4")
        }
        self.initialHeight = initialHeight
        self.maxChildViewsCount = maxChildViewsCount
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let amountSelectionViewController = AmountSelectionViewController(rootView: self)
        setupInitialView(viewControllerToPresent: amountSelectionViewController)
    }
}
