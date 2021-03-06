//
//  HQHomeModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

struct HQHomeModel: Codable {
    var banners: [HQBannerModel]?
    var members: [HQMemberModel]?
    var circles: [HQCircleModel]?
    var supply_demands: [HQSupplyModel]?
}
