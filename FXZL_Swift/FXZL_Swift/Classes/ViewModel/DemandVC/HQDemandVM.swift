//
//  HQDemandVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandVM: HQBaseViewModel {
    var dataArray: [HQSupplyModel]?
    var demandDetailModel: HQDemandDetailModel?
    var sid: Int?
    
    func requestDemandData(_ callback: @escaping (_ success: Bool)->()) {
//        let params = ["search_type": 1,
//                      "order_type": 0,
//                      "demand_type": 0,
//                      "supply_type": 0,
//                      "page": page];
//        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/SearchSupplyDemand", params: params) { (success, responseMessage) in
//            if success {
//                if let json = try? JSONSerialization.data(withJSONObject: responseMessage.responseObject as? [String : Any] ?? [:], options: .prettyPrinted) {
//                    self.dataArray = try? JSONDecoder().decode([HQSupplyModel].self, from: json)
//                }
//            }
//            callback(success)
//        }
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/Home", params: [:]) { (success, responseMessage) in
            if success {
                if let data = try? JSONSerialization.data(withJSONObject: responseMessage.responseObject as? [String:Any] ?? [:], options: .prettyPrinted) {
                    let homeModel = try? JSONDecoder().decode(HQHomeModel.self, from: data)
                    self.dataArray = homeModel?.supply_demands
                }
            }
            callback(success)
        }
    }
    
    func requestDemandDetailVC(_ callback: @escaping (_ success: Bool)->()) {
        guard let sid = sid else {
            return
        }
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/GetSupplyDemandInfo", params: ["sid":sid]) { (success, responseMessage) in
            if success {
                if let data = try? JSONSerialization.data(withJSONObject: responseMessage.responseObject as? [String:Any] ?? [:], options: .prettyPrinted) {
                    self.demandDetailModel = try? JSONDecoder().decode(HQDemandDetailModel.self, from: data)
                }
            }
            callback(success)
        }
    }
    func requestDemandChatVC(_ callback: @escaping (_ success: Bool)->()) {
        guard let sid = sid else {
            return
        }
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/ContactSupplyDemand", params: ["sid":sid]) { (success, responseMessage) in
            if success {
//                if let data = try? JSONSerialization.data(withJSONObject: responseMessage.responseObject as? [String:Any] ?? [:], options: .prettyPrinted) {
//                    self.demandDetailModel = try? JSONDecoder().decode(HQDemandDetailModel.self, from: data)
//                }
            }
            callback(success)
        }
    }
}
