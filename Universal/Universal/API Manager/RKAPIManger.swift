//
//  RKAPIManger.swift
//  Universal
//
//  Created by Sangram Patil on 16/04/18.
//  Copyright © 2018 Rahul Katkade. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire



class RKAPIManger: NSObject {

	static let RKsharedInstance = RKAPIManger()

	class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
		Alamofire.request(strURL).responseJSON { (responseObject) -> Void in

			print(responseObject)

			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				success(resJson)
			}
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}


	class func requestPOSTURL(_ strURL : String, params : [String : Any]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){

		Alamofire.request(strURL, method: .post, parameters: params, headers: headers).responseJSON { (responseObject) -> Void in

			print(responseObject)

			if responseObject.result.isSuccess {
				let resJson = JSON(responseObject.result.value!)
				success(resJson)
			}
			if responseObject.result.isFailure {
				let error : Error = responseObject.result.error!
				failure(error)
			}
		}
	}
}
