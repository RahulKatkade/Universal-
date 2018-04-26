//
//  AlertController.swift
//  Universal
//
//  Created by Sangram Patil on 16/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//
import UIKit
import Foundation
extension UIViewController {
	// MARK: - Global UIAlertController 

	func showAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		for (index, title) in actionTitles.enumerated() {
			let action = UIAlertAction(title: title, style: .default, handler: actions[index])
			alert.addAction(action)
		}
		self.present(alert, animated: true, completion: nil)
	}



}
