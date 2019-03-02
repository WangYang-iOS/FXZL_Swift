//
//  HQMemberModel.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

struct HQMemberModel: Codable {
    var mobile: String?
    var birthday: String?
    var nickname: String?
    var avatar: String?
    var uuid: String?
    var available_amount: String?
    var sex: String?
    var vip_state: Int?
    var authen_state: String?// 认证状态 -1未申请 0审核中 1审核通过 2审核未通过
    var company_id: Int?
    var company_name: String?
    var logo: String?
    var position_name: String?
    var industry_id: String?
    var industry_name: String?
    var imtoken: String?
    var token: String?
    var is_friend: Int?
    var is_in: Int?//是否在群 或者 圈中
    var isSelected: Bool?
    
    var cellHeight: CGFloat?
    
}
