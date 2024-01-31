//
//  CollapsibleViewControllerProtocol.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit

typealias CollapsibleViewController = UIViewController & CollapsibleViewControllerProtocol

protocol CollapsibleViewControllerProtocol where Self: UIViewController {

    // MARK: - Init

    init(rootView: CollapsibleStackRootView)

    // MARK: - IBOutlets

    var mainContainerView: TopRoundedCornerView { get set }
    var headerView: UIView { get set }
    var contentView: UIView { get set }
    var buttonView: TopRoundedCornerView! { get set}

    // MARK: - Dependency
    ///Make sure rootView should be week in all the viewController implementing this protocol
    var rootView: CollapsibleStackRootView! { get set }
    var isExpanded: Bool { get set }

    // MARK: - IBActions

    func didTappedOnHeaderView()
    func proceedToNextViewController()

}

extension CollapsibleViewControllerProtocol {

    func present(viewControllerToPresent: CollapsibleViewController) -> Bool {

        guard self.rootView.canPresentNextViewController() else { return false }
        
        let dimViewAlpha = self.rootView.getDimViewAlpha() // 1-> .30 2-> .20 3-> .10

        self.view.addDimView(alpha: dimViewAlpha)

        let presentingViewFrame = self.view.frame

        let presentingContainerFrame = self.mainContainerView.frame

        let currentHeaderHeight = self.headerView.frame.height


        viewControllerToPresent.view.frame = CGRect(x: 0, y: presentingViewFrame.height,
                                                    width: presentingViewFrame.width,
                                                    height: presentingViewFrame.height)
        viewControllerToPresent.buttonView.alpha = 0
        viewControllerToPresent.headerView.alpha = 0

        self.view.addSubview(viewControllerToPresent.view)
        self.addChild(viewControllerToPresent)

        UIView.animate(withDuration: 0.5, animations: {[self] in
            self.headerView.alpha = 1
            self.buttonView.alpha = 0
            viewControllerToPresent.view.frame = CGRect(x: 0, y: presentingContainerFrame.minY + currentHeaderHeight,
                                                        width: presentingContainerFrame.width,
                                                        height: presentingContainerFrame.height - currentHeaderHeight)
            self.contentView.alpha = 0

        }){ _ in
            UIView.animate(withDuration: 0.5, animations: {
                viewControllerToPresent.buttonView.alpha = 1
            })
        }
        return true
    }

    func dismissAbovePresentedViewController() {
        guard let presentedVC = self.children.first else { return }

        UIView.animate(withDuration: 0.5, animations: {
            self.headerView.alpha = 0
            presentedVC.view.alpha = 0
            let currentFrame =  presentedVC.view.frame

            presentedVC.view.frame = CGRect(x: 0, y: currentFrame.maxY,
                                            width: currentFrame.width, height: currentFrame.height)
            self.contentView.alpha = 1
            self.view.removeDimView()
            
        }) { _ in
            presentedVC.view.removeFromSuperview()
            presentedVC.removeFromParent()
            UIView.animate(withDuration: 0.5, animations: {
                self.buttonView.alpha = 1
            })
        }
    }
}
