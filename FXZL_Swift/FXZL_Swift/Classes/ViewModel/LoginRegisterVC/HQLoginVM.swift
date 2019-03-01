//
//  HQLoginVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQLoginVM: HQBaseViewModel {
    var phone = "13516829309"
    var password = "123456"
    
    func requestLoginAPi(callback:@escaping (_ result: Bool) -> ()) {
        let params = ["mobile": phone,"pwd": password]
        HQNetworkManager.postRequest(urlString: "api/V1/Member/Login", params: params) { (success, responseMessage) in
            if success {
                let member_info = (responseMessage.responseObject as AnyObject)["member_info"] as? [String : AnyObject]
                let data = try? JSONSerialization.data(withJSONObject: member_info ?? [:], options: .prettyPrinted)
                let user = try? JSONDecoder().decode(HQUser.self, from: data!)
                HQUser.shareUser.layoutUser(user: user)
                HQCommonTool.saveValue(kUUIDKey, HQUser.shareUser.uuid)
                HQCommonTool.saveValue(kPhoneKey, self.phone)
                HQCommonTool.saveValue(kPasswordKey, self.password)
            }
            callback(success)
        }
    }
    
}
