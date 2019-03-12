//
//  HQDemandVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandVM: HQBaseViewModel {
    var demandArray: [HQSupplyModel]?
    var conectArray: [HQSupplyModel]?
    var demandDetailModel: HQDemandDetailModel?
    var sid: Int?
    var search_type: Int = 1
    
    func requestDemandData(_ callback: @escaping (_ success: Bool)->()) {
        let params = ["search_type": search_type,
                      "order_type": 0,
                      "demand_type": 0,
                      "supply_type": 0,
                      "page": page] ;
        HQNetworkManager.postRequest(urlString: "api/V1/SupplyDemand/SearchSupplyDemand", params: params) { (success, responseMessage) in
            if success {
                if let json = responseMessage.responseObject as? NSArray {
                    let array = [HQSupplyModel].deserialize(from: json)
                    if self.search_type == 1 {
                        self.demandArray = array as? [HQSupplyModel]
                    }else {
                        self.conectArray = array as? [HQSupplyModel]
                    }
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
                if let dic = responseMessage.responseObject as? [String:Any] {
                    self.demandDetailModel = HQDemandDetailModel.deserialize(from: dic)
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
