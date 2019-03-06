//
//  HQDemandHeaderFooterView.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/6.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandHeaderFooterView: UITableViewHeaderFooterView {
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: RECT(20, 0, 200, 60))
        label.font = PingFangSCBold(15)
        label.textColor = UIColor.hexString(colorString: "2B3343")
        return label
    }()
    lazy var lineLabel: UILabel = {
        let label = UILabel.init(frame: RECT(20, 60 - kLineH, kScreenW - 20 * 2, kLineH))
        label.backgroundColor = UIColor.hexString(colorString: "ebebeb")
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
