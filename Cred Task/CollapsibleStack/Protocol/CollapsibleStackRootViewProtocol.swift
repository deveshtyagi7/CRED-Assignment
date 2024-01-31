//
//  CollapsibleStackRootViewProtocol.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit
typealias CollapsibleStackRootView =  UIViewController & CollapsibleStackRootViewProtocol

protocol CollapsibleStackRootViewProtocol where Self : UIViewController {
    var maxChildViewsCount: Int! { get set }
    var initialHeight: CGFloat! { get set }
    init?(maxChildViewsCount: Int, initialHeight: CGFloat) throws
}

extension CollapsibleStackRootViewProtocol {

    func setupInitialView(viewControllerToPresent: CollapsibleViewController) {
        let rootViewFrame =  self.view.frame
        viewControllerToPresent.view.frame = CGRect(x: 0, y: rootViewFrame.maxY,
                                                    width: rootViewFrame.width, height: self.initialHeight)
        viewControllerToPresent.headerView.alpha = 0

        self.view.addSubview(viewControllerToPresent.view)
        self.addChild(viewControllerToPresent)
        UIView.animate(withDuration: 0.5, animations: {
            viewControllerToPresent.view.frame = CGRect(x: 0, y: rootViewFrame.maxY - self.initialHeight,
                                                        width: rootViewFrame.width, height: self.initialHeight)
        })
    }

    func canPresentNextViewController() -> Bool {
        let allChildrenCount = countChildCollapsibleView()
        return allChildrenCount < self.maxChildViewsCount
    }

    func countChildCollapsibleView() -> Int {
        var count = 0
        var currentViewController: UIViewController? = self.children.first

        while let viewController = currentViewController as? CollapsibleViewController {
            count += 1
            currentViewController = viewController.children.first
        }

        return count
    }


    func getDimViewAlpha() -> CGFloat {
        let presentedChildCollapsibleView = countChildCollapsibleView()
        let remainingViewControllers = self.maxChildViewsCount - presentedChildCollapsibleView
        return CGFloat(remainingViewControllers) / 10
    }
}
