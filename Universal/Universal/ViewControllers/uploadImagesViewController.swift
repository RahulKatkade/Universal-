//
//  uploadImagesViewController.swift
//  Universal
//
//  Created by Sangram Patil on 23/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//
/*/*Image upload functionality :
 
 URL: http://bidwheelz.m-staging.in/bidwheelz_ws/image-insert
  Post parameter :
 cid,vid,imageone
Note : imageone variable send multiple image in base 64 formate.*/*/

import UIKit
import Fusuma
import Photos
class uploadImagesViewController: UIViewController,FusumaDelegate {

    var SelectedAssets = [PHAsset]()
    var PhotoArray     = [UIImage]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func UploadImages(ImageArray:[String] )  {
		let imageone = ImageArray.joined(separator: ",")
		let BodyParamter: [String: Any] = ["cid"        : 157,
										   "vid"        : 158,
										   "imageone"   : imageone]

		print(BodyParamter)
		RKAPIManger.requestPOSTURL("http://bidwheelz.m-staging.in/bidwheelz_ws/image-insert", params: BodyParamter, headers: nil, success: { (respons) in
			print(respons)

		}) { (error) in
			print(error)
		}
	}

    @IBAction func addImagesClicked(_ sender: Any) {
		// Show Fusuma
		let fusuma = FusumaViewController()
		fusuma.delegate = self
		fusuma.cropHeightRatio = 1.0
		fusuma.allowMultipleSelection = true
		fusumaSavesImage = true
		self.present(fusuma, animated: true, completion: nil)
    }

    func convertAssetToImages() -> Void {
        var Base64Array    = [String]()
        if SelectedAssets.count != 0{
            for i in 0..<SelectedAssets.count{
                
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                
                print(self.SelectedAssets[i].originalFilename!)
                
                manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                    self.PhotoArray.append(thumbnail)
                    let imgeName = self.SelectedAssets[i].originalFilename!
                    let str: String!
                    if (imgeName .hasSuffix(".JPG")){
                        print("//.jpg")
                        str  = thumbnail.base64(format: .JPEG(0.7))
                    }
                    else{
                        print("Png")
                        str  = thumbnail.base64(format: .PNG)
                    }
					Base64Array.append(str)
                   
                    
                })
            }
			UploadImages(ImageArray: Base64Array)     // upload Images to server
          print(Base64Array.count)
            print(Base64Array)
        }
    }
	// MARK: FusumaDelegate Protocol
	func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
		switch source {
		case .camera:
			print("Image captured from Camera")
		case .library:
			print("Image selected from Camera Roll")
		default:
			print("Image selected")
		}
	}

	func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode, SelectedAssets: [PHAsset]) {
		print("Number of selection images: \(images.count)")
		for i in 0..<SelectedAssets.count{
			self.SelectedAssets.append(SelectedAssets[i])
		}
    self.convertAssetToImages()

	}

	func fusumaCameraRollUnauthorized() {

		print("Camera roll unauthorized")

		let alert = UIAlertController(title: "Access Requested",
									  message: "Saving image needs to access your photo album",
									  preferredStyle: .alert)

		alert.addAction(UIAlertAction(title: "Settings", style: .default) { (action) -> Void in

			if let url = URL(string:UIApplicationOpenSettingsURLString) {

				UIApplication.shared.openURL(url)
			}
		})

		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in

		})

		guard let vc = UIApplication.shared.delegate?.window??.rootViewController,
			let presented = vc.presentedViewController else {

				return
		}

		presented.present(alert, animated: true, completion: nil)
	}
	func fusumaVideoCompleted(withFileURL fileURL: URL) {

	}
	func fusumaClosed() {

		print("Called when the FusumaViewController disappeared")
	}
	func fusumaWillClosed() {

		print("Called when the close button is pressed")
	}
}
extension PHAsset {
    var originalFilename: String? {
		if #available(iOS 9.0, *) {
			return PHAssetResource.assetResources(for: self).first?.originalFilename
		} else {
			// Fallback on earlier versions
			return ""
		}
    }
}


/*{
 "cid" : 750,
 "error_code" : "1",
 "ImageArray" : [
 {
 "id" : "749",
 "image" : "http:\/\/bidwheelz.m-staging.in\/vendor\/vendorcarimages\/5add987739d8c.jpg"
 },
 {
 "id" : "750",
 "image" : "http:\/\/bidwheelz.m-staging.in\/vendor\/vendorcarimages\/5add9bd199655.jpg"
 }
 ],
 "message" : "Insert successfully."
 }*/
