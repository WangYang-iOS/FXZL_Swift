//
//  HQCommonConfig.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

let kSpaceName = Bundle.main.infoDictionary!["CFBundleName"]
let kAppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]

let kScreen                 = UIScreen.main.bounds
let kScreenW                = kScreen.size.width
let kScreenH                = kScreen.size.height
let kSafeTop                = kScreenH >= 812.0 ? 24 : 0
let kSafeBottom             = kScreenH >= 812.0 ? 34 : 0
let kNavH                   = kScreenH >= 812.0 ? 88 : 64
let KTabH                   = 49

let kLineH                  = 1 / UIScreen.main.scale

func RECT(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

func SIZE(width:CGFloat,height:CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
}

func POINT(x:CGFloat,y:CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}







