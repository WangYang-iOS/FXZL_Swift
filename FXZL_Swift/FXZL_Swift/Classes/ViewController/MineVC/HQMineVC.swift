//
//  HQMineVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit
import Kingfisher

class HQMineVC: HQBaseVC {
    @IBOutlet weak var scrollW: NSLayoutConstraint!
    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var logoIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentH: NSLayoutConstraint!
    
    var mineVM = HQMineVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollW.constant = kScreenW
        
        mineVM.requesetUserInfo { (success) in
            if success {
                
            }
        }
        
        func resetUserInfo() -> Void{
            headerImgV
        }
        
    }
    
    @IBAction func clickUserButton(_ sender: UIButton) {
        
    }
    
}
