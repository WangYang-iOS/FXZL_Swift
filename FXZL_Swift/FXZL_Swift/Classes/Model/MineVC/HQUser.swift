//
//  HQUser.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUser: Codable {
    var sex : String?
//    var vip_state : String?
    var mobile : String?
    var birthday : String?
    var nickname : String?
    var avatar : String?
    var uuid : String?
    var vip_end_dt : String? //VIP到期时间
    var available_amount :Int? // 可用余额
    var authen_state :Int? // 认证状态 -1未申请 0审核中 1审核通过 2审核未通过
    var company_id :Int?
    var company_name : String?
    var logo : String?
    var position_name : String?
    var industry_id : String?
    var imtoken : String?
    var token : String?
    
    static let shareUser = HQUser()
    private init() {}

    func layoutUser(user:HQUser?) -> Void {
        sex = user?.sex
        mobile = user?.mobile
        birthday = user?.birthday
        nickname = user?.nickname
        avatar = user?.avatar
        uuid = user?.uuid
        available_amount = user?.available_amount
        vip_end_dt = user?.vip_end_dt
        authen_state = user?.authen_state
        company_id = user?.company_id
        company_name = user?.company_name
        logo = user?.logo
        position_name = user?.position_name
        industry_id = user?.industry_id
        imtoken = user?.imtoken
        token = user?.token
    }
    
    func reset() -> Void {
        sex = ""
//        vip_state = ""
        mobile = ""
        birthday = ""
        nickname = ""
        avatar = ""
        uuid = ""
        available_amount = 0
        vip_end_dt = ""
        authen_state = -1
        company_id = 0
        company_name = ""
        logo = ""
        position_name = ""
        industry_id = ""
        imtoken = ""
        token = ""
    }
}
