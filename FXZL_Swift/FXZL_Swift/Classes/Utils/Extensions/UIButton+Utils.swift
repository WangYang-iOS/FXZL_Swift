//
//  UIButton+Utils.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

enum HQButtonEdgeInsetsStyle : Int {
    case top = 0 // image在上，label在下
    case left = 1 // image在左，label在右
    case bottom = 2 // image在下，label在上
    case right = 3 // image在右，label在左
}

extension UIButton {
    
    func layoutButton(style: HQButtonEdgeInsetsStyle, space: CGFloat) -> Void {
        // 1. 得到imageView和titleLabel的宽、高
        let imageWith = imageView?.frame.size.width ?? 0;
        let imageHeight = imageView?.frame.size.height ?? 0;
        
        var labelWidth : CGFloat = 0.0;
        var labelHeight : CGFloat = 0.0;
        let version = Double(kSystemVersion) ?? 0
        
        if (version >= 8.0) {
            // 由于iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = titleLabel?.intrinsicContentSize.width ?? 0;
            labelHeight = titleLabel?.intrinsicContentSize.height ?? 0;
        } else {
            labelWidth = titleLabel?.frame.size.width ?? 0;
            labelHeight = titleLabel?.frame.size.height ?? 0;
        }
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero;
        var labelEdgeInsets = UIEdgeInsets.zero;
        
        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        case .left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        case .bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        case .right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
    
}
