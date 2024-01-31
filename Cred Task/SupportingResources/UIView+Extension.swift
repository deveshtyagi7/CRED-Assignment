//
//  UIView+Extension.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit
extension UIView {

    func addDimView(alpha: CGFloat = 0.15) {
        let dimView = UIView(frame: self.bounds)
        dimView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        dimView.tag = 999 // Use a tag to identify the dim view later if needed
        dimView.isUserInteractionEnabled = false
        self.addSubview(dimView)
    }

    func removeDimView() {
        if let dimView = self.viewWithTag(999) {
            // Remove the dimmed overlay view
            dimView.removeFromSuperview()
        }
    }
}
