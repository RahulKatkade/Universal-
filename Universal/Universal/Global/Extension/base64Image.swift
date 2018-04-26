//
//  base64Image.swift
//  Universal
//
//  Created by Sangram Patil on 23/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//

import Foundation
import UIKit
public enum ImageFormat {
    case PNG
    case JPEG(CGFloat)
}
//extension UIImage {
//
//    public func base64(format: ImageFormat) -> String {
//        var imageData: NSData
//        switch format {
//        case .PNG: imageData = UIImagePNGRepresentation(self)! as NSData
//        case .JPEG(let compression): imageData = UIImageJPEGRepresentation(self, compression)! as NSData
//        }
//        return imageData.base64EncodedString(options: .endLineWithCarriageReturn)
//    }
//}


extension UIImage {

	public func base64(format: ImageFormat) -> String? {
		var imageData: Data?
		switch format {
		case .PNG: imageData = UIImagePNGRepresentation(self)
		case .JPEG(let compression): imageData = UIImageJPEGRepresentation(self, compression)
		}
		return imageData?.base64EncodedString()
	}
}
