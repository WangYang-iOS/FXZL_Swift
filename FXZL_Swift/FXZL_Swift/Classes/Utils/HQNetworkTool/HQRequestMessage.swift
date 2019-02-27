//
//  HQRequestMessage.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import Foundation

enum HQHTTPMethod : String {
    case POST = "POST"
    case GET = "GET"
}

class HQRequestMessage {
    var url : String = ""
    var method : HQHTTPMethod = .POST
    var args : [String : Any] = [:]
    
    init(url: String, method: HQHTTPMethod = .POST, args: [String : Any]) {
        self.url = url
        self.method = method
        self.args = args
    }
}
