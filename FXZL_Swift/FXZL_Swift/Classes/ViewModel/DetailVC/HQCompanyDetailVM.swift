//
//  HQCompanyDetailVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation

class HQCompanyDetailVM: HQBaseViewModel {
    var cid: Int?
    var companyDetailModel: HQCompanyDetailModel?
    
    var logo: String? {
        get{
            return companyDetailModel?.company?.logo
        }
    }
    var name: String? {
        get {
            return companyDetailModel?.company?.name
        }
    }
    
    
    
    
    func requestCompanyDetail(callback: @escaping (_ success: Bool)->()) -> Void {
        guard let cid = cid else {
            return
        }
        let params = ["cid":cid,
                      "page":page]
        HQNetworkManager.postRequest(urlString: "api/V1/Member/GetCompanyInfo", params: params) { (success, responseMessage) in
            if success {
                if let json = responseMessage.responseObject as? [String:Any] {
                    self.companyDetailModel = HQCompanyDetailModel.deserialize(from: json)
                }
            }
            callback(success)
        }
    }
    
    
}
