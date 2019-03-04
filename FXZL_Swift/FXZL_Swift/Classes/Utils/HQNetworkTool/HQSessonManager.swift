//
//  HQSessonManager.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation
import AFNetworking

class HQSessonManager {
    class func postRequest(urlString: String, params: [String:Any], callback:@escaping (_ success: Bool,_ responseMessage: HQResponseMessage) -> ()) {
        let sessionManager = AFURLSessionManager.init(sessionConfiguration: URLSessionConfiguration.default)
        let URLString = kDomain + urlString
        print("token == " + "\(HQUser.shareUser.token ?? "")" + "\nuuid == " + "\(HQUser.shareUser.uuid ?? "")")
        
        let request = AFJSONRequestSerializer().request(withMethod: "POST", urlString: URLString, parameters: params, error: nil)
        request.setValue(HQUser.shareUser.uuid ?? "0", forHTTPHeaderField: "uuid")
        request.setValue(HQUser.shareUser.token ?? "", forHTTPHeaderField: "token")
        request.setValue(kAppVersion, forHTTPHeaderField: "version")
        request.setValue("1", forHTTPHeaderField: "device_type")
        request.setValue(kSystemVersion, forHTTPHeaderField: "sysVersion")
        request.setValue(String(NSDate().timeIntervalSince1970), forHTTPHeaderField: "ts")
        
        let task = sessionManager.dataTask(with: request as URLRequest, uploadProgress: { (progress) in
            //
        }, downloadProgress: { (progress) in
            //
        }) { (response, responseObject, errror) in
            print(responseObject)
        }
        task.resume()
        
    }
}
