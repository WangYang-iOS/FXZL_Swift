//
//  HQHomeHeaderView.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQHomeHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    func layoutHeaderView(title: String?,buttonTitle: String?="更多") -> Void {
        titleLabel.text = title
        moreButton.setTitle(buttonTitle, for: .normal)
    }

    @IBAction func clickMoreButton(_ sender: UIButton) {
        
    }
}
