//
//  HQPasswordVM.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/27.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQPasswordVM: HQBaseViewModel {
    var phone = ""
    var code = ""
    var password = ""
    
    func sendCodeRequest(callback: @escaping (_ success:Bool)->()) -> Void {
        if phone.count == 0 {
            print("请输入手机号")
            return
        }
        let params = ["mobile":phone,
                      "type":"2"]
        HQNetworkManager.postRequest(urlString: "api/V1/Member/SendMsg", params: params) { (success, responseMessage) in
            callback(success)
        }
    }
    
    func passwordRequest(callback: @escaping (_ success:Bool, _ response:HQResponseMessage)->()) -> Void {
        if phone.count == 0 {
            print("请输入手机号")
            return
        }
        if code.count == 0 {
            print("请输入验证码")
            return
        }
        if password.count == 0 {
            print("请输入密码")
            return
        }
        if password.count < 6 {
            print("请输入6-18位的密码")
            return
        }
        let params = ["mobile": phone,
                      "newpwd": password,
                      "code": code]
        HQNetworkManager.postRequest(urlString: "api/V1/Member/ForgetPassword", params: params) { (success, responseMessage) in
            callback(success,responseMessage)
        }
    }
}
