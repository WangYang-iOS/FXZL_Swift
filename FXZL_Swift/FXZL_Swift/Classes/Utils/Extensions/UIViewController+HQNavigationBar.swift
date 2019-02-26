//
//  UIViewController+HQNavigationBar.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

private var kHQNavigationBar : String = ""

extension UIViewController {
    var hq_navigation: HQNavigationBar {
        get{
            var navigationBar = objc_getAssociatedObject(self, &kHQNavigationBar) as? HQNavigationBar
            if navigationBar == nil {
                navigationBar = HQNavigationBar.init(frame: RECT(0, 0, kScreenW, kNavH))
                objc_setAssociatedObject(self, &kHQNavigationBar, navigationBar, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                self.view.addSubview(navigationBar!)
            }
            return navigationBar!
        }
        set{
            objc_setAssociatedObject(self, &kHQNavigationBar, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
