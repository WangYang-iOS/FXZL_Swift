//
//  HQCommonTool.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

/// 获取用户权限
class HQCommonTool: NSObject {
    class func isLogin() -> Bool {
        return (HQUser.shareUser.uuid?.count ?? 0) > 0
    }
    class func isAuth() -> Bool {
        return HQUser.shareUser.authen_state == 1
    }
}

