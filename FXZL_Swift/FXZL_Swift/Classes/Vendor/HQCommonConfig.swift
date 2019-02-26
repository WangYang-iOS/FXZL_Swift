//
//  HQCommonConfig.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

let kSpaceName = Bundle.main.infoDictionary!["CFBundleName"] as! String
let kAppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

let kScreen                 = UIScreen.main.bounds
let kScreenW                = kScreen.size.width
let kScreenH                = kScreen.size.height
let kSafeTop : CGFloat      = kScreenH >= 812.0 ? 24.0 : 0.0
let kSafeBottom : CGFloat   = kScreenH >= 812.0 ? 34.0 : 0.0
let kNavH : CGFloat         = kScreenH >= 812.0 ? 88.0 : 64.0
let KTabH : CGFloat         = 49

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






