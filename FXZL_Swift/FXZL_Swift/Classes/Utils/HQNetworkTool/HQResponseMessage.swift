//
//  HQResponseMessage.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation

enum HQResponseState : String {
    case HQResponseStateSuccess     = "Success"
    case HQResponseStateFail        = "Fail"
    case HQResponseStateNoFinish    = "NoFinish"
}

class HQResponseMessage {
    var requestUrl = ""
    var requestArgs : [String : Any] = [:]
    var responseObject : Any?
    var retCode = ""
    var errorMessage = ""
    var responseState : HQResponseState = .HQResponseStateNoFinish
    
    init(url: String, args:[String:Any]) {
        requestUrl = url
        requestArgs = args
        print("请求接口 ==== " + url + "\n" + "请求参数 === " + "\(args)")
    }
}
