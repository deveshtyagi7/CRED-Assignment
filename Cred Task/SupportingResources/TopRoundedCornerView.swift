//
//  TopRoundedCornerView.swift
//  Cred Task
//
//  Created by Devesh Tyagi on 25/11/23.
//

import UIKit
class TopRoundedCornerView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius: CGFloat = 20.0 // You can adjust this value based on your preference
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topLeft, .topRight],
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
