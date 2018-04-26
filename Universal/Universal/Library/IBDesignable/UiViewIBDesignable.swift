//
//  UiViewIBDesignable.swift
//  Universal
//
//  Created by Sangram Patil on 19/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//

import UIKit



@IBDesignable extension UIView {

	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
		}
	}

	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var borderColor: UIColor? {
		get {
			if let color = layer.borderColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.borderColor = color.cgColor
			} else {
				layer.borderColor = nil
			}
		}
	}

	@IBInspectable var shadowRadius: CGFloat {
		get {
			return layer.shadowRadius
		}
		set {
			layer.shadowRadius = newValue
		}
	}

	@IBInspectable var shadowOpacity: Float {
		get {
			return layer.shadowOpacity
		}
		set {
			layer.shadowOpacity = newValue
		}
	}

	@IBInspectable var shadowOffset: CGSize {
		get {
			return layer.shadowOffset
		}
		set {
			layer.shadowOffset = newValue
		}
	}

	@IBInspectable var shadowColor: UIColor? {
		get {
			if let color = layer.shadowColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.shadowColor = color.cgColor
			} else {
				layer.shadowColor = nil
			}
		}
	}
}

@IBDesignable
extension UITextField {

	@IBInspectable var paddingLeft: CGFloat {
		get {
			return leftView!.frame.size.width
		}
		set {
			let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
			leftView = paddingView
			leftViewMode = .always
		}
	}

	@IBInspectable var paddingRight: CGFloat {
		get {
			return rightView!.frame.size.width
		}
		set {
			let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
			rightView = paddingView
			rightViewMode = .always
		}
	}

	@IBInspectable var placeHolderColor: UIColor? {
		get {
			return self.placeHolderColor
		}
		set {
//Rahul			self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
		}
	}
}

//@IBDesignable
//extension UILabel {
//    @IBInspectable var leftTextInset: CGFloat {
//        set { textInsets.left = newValue }
//        get { return textInsets.left }
//    }
//
//    @IBInspectable var rightTextInset: CGFloat {
//        set { textInsets.right = newValue }
//        get { return textInsets.right }
//    }
//
//    @IBInspectable var topTextInset: CGFloat {
//        set { textInsets.top = newValue }
//        get { return textInsets.top }
//    }
//
//    @IBInspectable var bottomTextInset: CGFloat {
//        set { textInsets.bottom = newValue }
//        get { return textInsets.bottom }
//    }
//}

