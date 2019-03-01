//
//  UITableView+Methods.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCellNib(_ nib: String) -> Void {
        self.register(UINib.init(nibName: nib, bundle: nil), forCellReuseIdentifier: nib)
    }
    func registerCellClass(_ className: String) -> Void {
        self.register(NSClassFromString(className), forCellReuseIdentifier: className)
    }
    func registerHeaderFooterNib(_ nib: String) -> Void {
        self.register(UINib.init(nibName: nib, bundle: nil), forHeaderFooterViewReuseIdentifier: nib)
    }
    func registerHeaderFooterClass(_ className: String) -> Void {
        self.register(NSClassFromString(className), forHeaderFooterViewReuseIdentifier: className)
    }
    
    func estimatedHeight() -> Void {
        estimatedRowHeight = UITableViewAutomaticDimension
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
    }
    
}

