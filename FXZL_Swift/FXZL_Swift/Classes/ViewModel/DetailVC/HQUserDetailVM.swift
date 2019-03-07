//
//  HQUserDetailVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/7.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUserDetailVM: HQBaseViewModel {
    var uuid: String?
    var userInfo: HQUserInfoModel?
    
    func requestUserInfo(callback: @escaping (_ success: Bool)->()) -> Void {
        guard let uuid = uuid else {
            return
        }
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/GetMemberSupplyDemandInfo", params: ["uuid":uuid]) { (success, responseMessage) in
            if success {
                if let dic = responseMessage.responseObject as? [String:Any] {
                    self.userInfo = HQUserInfoModel.deserialize(from: dic)
                }
            }
            callback(success)
        }
    }
}
