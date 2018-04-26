//
//  customeUILabel.swift
//  Universal
//
//  Created by Sangram Patil on 16/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {

	// MARK: - calculate Number of line in label

	func calculateMaxLines() -> Int {
		let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
		let charSize = font.lineHeight
		let text = (self.text ?? "") as NSString
//Rahul		let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
		let lines = 3 //Int(textSize.height/charSize)
		return lines
	}

}
