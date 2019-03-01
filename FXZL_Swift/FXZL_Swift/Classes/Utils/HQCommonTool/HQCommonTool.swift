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

// MARK: - 本地读写操作
extension HQCommonTool {
    class func saveValue(_ key: String, _ value : Any?) -> Void {
        if value == nil {
            return
        }
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func valueForkey(_ key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    class func removeValue(_ key: String) -> Void {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
