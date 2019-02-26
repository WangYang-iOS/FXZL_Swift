//
//  UIColor+Hex.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexString(colorString:String ,alpha:CGFloat = 1.0) -> UIColor {
        var string = colorString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if string.characters.count < 6 {
            return UIColor.clear
        }
        if string.hasPrefix("0X") {
            string = string.substring(from: string.index(string.startIndex, offsetBy: 2))
        }
        if string.hasPrefix("#") {
            string = string.substring(from: string.index(after: string.startIndex))
        }
        if string.characters.count != 6 {
            return UIColor.clear
        }
        
        let rRange = string.startIndex ..< string.index(string.startIndex, offsetBy: 2)
        let rStr = string.substring(with: rRange)
        
        let gRange = string.index(string.startIndex, offsetBy: 2) ..< string.index(string.startIndex, offsetBy: 4)
        let gStr = string.substring(with: gRange)
        
        let bIndex = string.index(string.endIndex, offsetBy: -2)
        let bStr = string.substring(from: bIndex)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}
