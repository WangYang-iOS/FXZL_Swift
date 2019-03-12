//
//  HQUserInfoModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/7.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation

struct HQUserInfoModel: HandyJSON {
    var member: HQMemberModel?
    var supply_demand:[HQSupplyModel]?
    var circles: HQCircleModel?
    var is_friend: Int?
    var is_circle: Int?
    var count_members: Int?
    var count_supplys: Int?
    var share_url: String?
}
