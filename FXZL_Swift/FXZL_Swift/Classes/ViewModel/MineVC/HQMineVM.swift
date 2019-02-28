//
//  HQMineVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/28.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQMineVM: HQBaseViewModel {

    func requesetUserInfo(callback: @escaping (_ success: Bool)->()) -> Void {
        if HQUser.shareUser.uuid?.count == 0 {
            return
        }
        HQNetworkManager.postRequest(urlString: "api/V1/Member/GetMemberInfo", params: [:]) { (success, responseMessage) in
            if success {
                let data = try? JSONSerialization.data(withJSONObject: responseMessage.responseObject ?? [:], options: .prettyPrinted)
                let user = try? JSONDecoder().decode(HQUser.self, from: data!)
                HQUser.shareUser.layoutUser(user: user)
            }
            callback(success)
        }
    }
}
