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
    class func postRequest(urlString: String, params: [String:Any], callback:@escaping (_ success: Bool,_ responseMessage: HQResponseMessage) -> ()) {
        let URLString = kDomain + urlString
        print("token == " + "\(HQUser.shareUser.token ?? "")" + "\nuuid == " + "\(HQUser.shareUser.uuid ?? "")")
        let headers = ["uuid":HQUser.shareUser.uuid ?? "0",
                       "token":HQUser.shareUser.token ?? "",
                       "version":kAppVersion,
                       "device_type":"1",
                       "sysVersion":kSystemVersion,
                       "ts":String(NSDate().timeIntervalSince1970)]
        Alamofire.request(URLString, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
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
                        responseMessage.responseState = .success
                        responseMessage.responseObject = dic["data"]
                        callback(true,responseMessage)
                    }else {
                        responseMessage.responseState = .fail
                        callback(false,responseMessage)
                    }
                case .failure(let error):
                    print(error)
                    callback(false,responseMessage)
            }
        }
    }
}
