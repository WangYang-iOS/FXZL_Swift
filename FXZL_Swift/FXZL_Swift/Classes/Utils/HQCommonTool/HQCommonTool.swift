//
//  HQCommonTool.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCommonTool: NSObject {
    class func isLogin() -> Bool {
        return (HQUser.shareUser.uuid?.count ?? 0) > 0
    }
}

