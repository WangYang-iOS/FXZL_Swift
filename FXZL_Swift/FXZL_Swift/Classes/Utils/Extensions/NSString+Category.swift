//
//  NSString+Category.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension String {
    func widthWithFont(_ font : UIFont) -> CGFloat {
        return (self as NSString).boundingRect(with: SIZE(CGFloat(MAXFLOAT), font.lineHeight), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : font], context: nil).size.width
    }
    func heightWithFont(_ font : UIFont, width : CGFloat, lineSpace: CGFloat? = 0) -> CGFloat {
        var dic = [NSAttributedStringKey:Any]()
        dic[NSAttributedStringKey.font] = font
        if let lineSpace = lineSpace {
            if lineSpace > 0 {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = lineSpace
                dic[NSAttributedStringKey.paragraphStyle] = paragraphStyle
            }
        }
        return (self as NSString).boundingRect(with: SIZE(width, CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: dic, context: nil).size.height
    }
    
    
    
}
