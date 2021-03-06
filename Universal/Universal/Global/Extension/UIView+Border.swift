//
//  UIView+Border.swift
//  Universal
//
//  Created by Sangram Patil on 18/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//
import UIKit
import Foundation
public enum UIButtonBorderSide {
	case top, bottom, left, right
}

extension UIView {

	public func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
		let border = CALayer()
		border.backgroundColor = color.cgColor

		switch side {
		case .top:
			border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
		case .bottom:
			border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
		case .left:
			border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
		case .right:
			border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
		}

		self.layer.addSublayer(border)
	}
}
