//
//  HQMineVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

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
        self.hq_navigation.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mineVM.requesetUserInfo { (success) in
            if success {
                self.resetUserInfo()
            }
        }
    }
    
    func resetUserInfo() -> Void{
        print(HQUser.shareUser.avatar)
        headerImgV.kf.setImage(with: URL(string: HQUser.shareUser.avatar ?? ""), placeholder: UIImage(named: "ic_noLogin_header"), options: nil, progressBlock: nil, completionHandler: nil)
        
    }
    
    @IBAction func clickUserButton(_ sender: UIButton) {
        
    }
    
}
