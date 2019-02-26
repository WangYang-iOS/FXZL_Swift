//
//  HQLoginVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQLoginVM: HQBaseViewModel {
    var phone = ""
    var password = ""
    
    func requestLoginAPi(callback:(_ result: Bool) -> ()) {
        callback(true)
    }
    
}
