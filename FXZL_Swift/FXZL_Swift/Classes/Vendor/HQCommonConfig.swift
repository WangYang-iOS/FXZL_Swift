//
//  HQCommonConfig.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

let kDomain                 = "http://api.fenxiangzl.com/"
let kDefaultUserHeader      = "ic_default_header"
let kDefaultLogo            = "ic_default_logo"



let kSpaceName              = Bundle.main.infoDictionary!["CFBundleName"] as! String
let kAppVersion             = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let kSystemVersion          = UIDevice.current.systemVersion


let kScreen                 = UIScreen.main.bounds
let kScreenW                = kScreen.size.width
let kScreenH                = kScreen.size.height
let kSafeTop : CGFloat      = kScreenH >= 812.0 ? 24.0 : 0.0
let kSafeBottom : CGFloat   = kScreenH >= 812.0 ? 34.0 : 0.0
let kNavH : CGFloat         = kScreenH >= 812.0 ? 88.0 : 64.0
let KTabH : CGFloat         = 49
let kStatusH: CGFloat       = kScreenH >= 812.0 ? 44.0 : 20.0

let kLineH                  = 1 / UIScreen.main.scale

func RECT(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}
func SIZE(_ width:CGFloat,_ height:CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
}
func POINT(_ x:CGFloat,_ y:CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}
func AdjustmentBehavior(_ scrollView : UIScrollView) -> Void {
    if #available(iOS 11.0, *) {
        scrollView.contentInsetAdjustmentBehavior = .never
    }
}
func PingFangSCRegular(_ size : CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Regular", size: size)!
}
func PingFangSCBold(_ size : CGFloat) -> UIFont {
    return UIFont(name: "PingFangSC-Semibold", size: size)!
}
func topSpaceConstant() -> CGFloat {
    if #available(iOS 11.0, *) {
        return kNavH - kStatusH
    }else {
        return kNavH
    }
}
func bottomSpaceConstant() -> CGFloat {
    if #available(iOS 11.0, *) {
        return 0
    }else {
        return KTabH + kSafeBottom
    }
}



