//
//  UIImageView+Load.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension UIImageView {
    func hq_setImage(image: String?, placeholder: String?) -> Void {
        if image == nil {
            self.image = UIImage(named: placeholder ?? " ")
            return
        }
        let url = URL(string: image!)
        self.kf.setImage(with: url, placeholder: UIImage(named: placeholder ?? " "), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
