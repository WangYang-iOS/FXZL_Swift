//
//  HQHomeVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQHomeVM: HQBaseViewModel {
    var homeModel: HQHomeModel?
    
    func requestHomeInfo(callback: @escaping (_ success: Bool)->()) -> Void {
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/Home", params: [:]) { (success, responseMessage) in
            if success {
                if let json = responseMessage.responseObject as? [String:AnyObject] {
                    if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                        self.homeModel = try? JSONDecoder().decode(HQHomeModel.self, from: data)
//                        print("Home === " + "\(self.homeModel)")
                    }
                }
            }
            callback(success)
        }
    }
}
