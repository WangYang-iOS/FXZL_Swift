//
//  HQProtocol.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

protocol HQProtocol {
    
}

extension HQProtocol where Self: UIView {
    static func loadNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}

extension HQProtocol where Self: UITableViewCell {
    static func registerCellNib(tableView: UITableView,_ nib: String? = nil) -> Void {
        tableView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forCellReuseIdentifier: nib ?? "\(self)")
    }
    static func registerCellClass(tableView: UITableView,_ className: String? = nil) -> Void {
        tableView.register(NSClassFromString(className ?? "\(self)"), forCellReuseIdentifier: className ?? "\(self)")
    }
    
}
