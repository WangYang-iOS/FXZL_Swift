//
//  HQSupplyModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

struct HQSupplyModel: Codable,HandyJSON {
    var sid: Int?
    var supply_type: String?
    var supply_content: String?
    var demand_type: String?
    var demand_content: String?
    var company_id: Int?
    var company_name: String?
    var logo: String?
    var position_name: String?
    var avatar: String?
    var uuid: String?
    var nickname: String?
    var create_dt: String?
    var industry_id: String?
    var industry_name: String?
    
    var view_num: Int?
    var money: CGFloat?
    var contact_num: Int?
    var type: Int?
    var vip_state: Int?
    var state: Int?//审核状态 0未审核 1审核通过 2不通过 3人脉完成 99已删除
    
    var is_friend: Int?
    var isSelected: Bool?
    
    var cellHeight: CGFloat?
    
}
