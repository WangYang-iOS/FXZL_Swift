//
//  HQDemandDetailModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation
import HandyJSON

struct HQDemandDetailModel: Codable, HandyJSON {
    var supply_demand: HQSupplyModel?
    var contacts: [HQContactModel]?
    var is_friend: Bool?
    var count_members: Int?
    var count_supplys: Int?
    var share_url: String?
}
