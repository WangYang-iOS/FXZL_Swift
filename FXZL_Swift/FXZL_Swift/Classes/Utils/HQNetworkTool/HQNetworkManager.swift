//
//  HQNetworkManager.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation
import Alamofire

class HQNetworkManager {
    
    class func postRequest(urlString: String, params: [String:String], callback:(_ success: Bool,_ response: String) -> ()) {
        let URLString = urlString + kDomain
        
        let param : Parameters = params
        let headers = ["Content-Type":"application/json",
                       "Accept":"application/json",
                       "uid":"0",
                       "version":kAppVersion,
                       "device_type":"1",
                       "sysVersion":kSystemVersion,
                       "ts":NSDate().timeIntervalSince1970,
                       "token":"0"] as [String : Any]
        

    }
    
    
    
    
}
