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
    class func postRequest(urlString: String, params: [String:String], callback:@escaping (_ success: Bool,_ responseMessage: HQResponseMessage) -> ()) {
        let URLString = kDomain + urlString
        let headers = ["uid":"0",
                       "version":kAppVersion,
                       "device_type":"1",
                       "sysVersion":kSystemVersion,
                       "ts":String(NSDate().timeIntervalSince1970),
                       "token":"0"]
        Alamofire.request(URLString, method: .post, parameters: params, headers: headers).responseJSON { (response) in
            let responseMessage = HQResponseMessage.init(url: URLString, args: params)
            
            switch response.result {
                case .success(let json):
                    print(json)
                    let dic = json as! [String : Any]
                    let code : Int? = dic["code"] as? Int
                    let msg : String? = dic["msg"] as? String
                    responseMessage.retCode = String(code ?? 1)
                    responseMessage.errorMessage = msg ?? ""
                    if code == 0 {
                        responseMessage.responseState = .HQResponseStateSuccess
                        responseMessage.responseObject = dic["data"]
                        callback(true,responseMessage)
                    }else {
                        responseMessage.responseState = .HQResponseStateFail
                        callback(false,responseMessage)
                    }
                case .failure(let error):
                    print(error)
                    callback(false,responseMessage)
            }
        }
    }
}
