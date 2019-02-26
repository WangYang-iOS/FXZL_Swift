//
//  UIView+Category.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var yy_cornerRadius : CGFloat {
        get{return layer.cornerRadius}
        set{layer.cornerRadius = newValue;layer.masksToBounds = true}
    }
    @IBInspectable
    var yy_borderWidth : CGFloat {
        get{return layer.borderWidth}
        set{layer.borderWidth = newValue}
    }
    @IBInspectable
    var yy_borderColor : UIColor {
        get{return UIColor.init(cgColor: layer.borderColor!)}
        set{layer.borderColor = newValue.cgColor}
    }
    @IBInspectable
    var yy_shadowRadius : CGFloat {
        get{return layer.shadowRadius}
        set{layer.shadowRadius = newValue}
    }
    @IBInspectable
    var yy_shadowOpacity : CGFloat {
        get{return CGFloat(layer.shadowOpacity)}
        set{layer.shadowOpacity = Float(newValue)}
    }
    @IBInspectable
    var yy_shadowOffset : CGSize {
        get{return layer.shadowOffset}
        set{layer.shadowOffset = newValue}
    }
    @IBInspectable
    var yy_shadowColor : UIColor {
        get{return UIColor.init(cgColor: layer.shadowColor!)}
        set{layer.shadowColor = newValue.cgColor}
    }
    
    
    func getX() -> CGFloat {
        return self.frame.origin.x
    }
    func getY() -> CGFloat {
        return self.frame.origin.y
    }
    func getWidth() -> CGFloat {
        return self.frame.size.width
    }
    func getHeight() -> CGFloat {
        return self.frame.size.height
    }
    func getMidX() -> CGFloat {
        return self.center.x
    }
    func getMidY() -> CGFloat {
        return self.center.y
    }
    func getMaxX() -> CGFloat {
        return getX() + getWidth()
    }
    func getMaxY() -> CGFloat {
        return getY() + getHeight()
    }
    func cornerWithRadius(_ radius:CGFloat) -> Void {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    func addBorder(radius:CGFloat, width:CGFloat, color:String) -> Void {
        layer.borderColor = UIColor.hexString(colorString: color).cgColor
        layer.borderWidth = width
        cornerWithRadius(radius)
    }
    func addShadow(radius:CGFloat, color:String, opacity:CGFloat, offset:CGSize) -> Void {
        layer.shadowColor = UIColor.hexString(colorString: color).cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = Float(opacity)
    }
}
