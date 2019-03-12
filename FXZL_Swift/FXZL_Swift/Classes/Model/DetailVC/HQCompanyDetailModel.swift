//
//  HQCompanyDetailModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation

struct HQCompanyDetailModel: HandyJSON {
    var company: HQCompanyInfoModel?
    var member: [HQMemberModel]?
    var supply: [HQSupplyModel]?
    var share_url: String?
}
