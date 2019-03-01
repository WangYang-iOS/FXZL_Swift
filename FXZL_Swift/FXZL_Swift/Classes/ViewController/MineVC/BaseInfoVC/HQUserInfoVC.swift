//
//  HQUserInfoVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUserInfoVC: HQBaseVC {

    @IBOutlet weak var scrollW: NSLayoutConstraint!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var userImgV: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var sexTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    @IBOutlet weak var positionTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollW.constant = kScreenW
        topSpace.constant = kNavH
        hq_navigation.title = "个人资料"
        hq_navigation.rightButtonTitle = "完成"
        hq_navigation.removeNavigationBarBottomLine(false)
        refreshUserInfo()
    }
    
    @IBAction func clickImgButton(_ sender: UIButton) {
        
    }
    @IBAction func clickSexButton(_ sender: UIButton) {
        if HQCommonTool.isAuth() {
            return
        }
        HQCommonMethods.showSheetView(title: "请选择性别", message: nil, cancelButtonTitle: "取消", buttontitles: ["男","女"], cancelBlock: {
            //
        }) { (action) in
            self.sexTF.text = action.title
        }
    }
    @IBAction func clickBirthdayButton(_ sender: UIButton) {
        
    }
}

extension HQUserInfoVC {
    func refreshUserInfo() -> Void {
        userImgV.hq_setImage(image: HQUser.shareUser.avatar, placeholder: "ic_noLogin_header")
        nameTF.text = HQUser.shareUser.nickname
        nameTF.isEnabled = !HQCommonTool.isAuth()
        if HQUser.shareUser.sex == "0" {
            sexTF.text = ""
        }else if HQUser.shareUser.sex == "1" {
            sexTF.text = "男"
        }else {
            sexTF.text = "女"
        }
        birthdayTF.text = HQUser.shareUser.birthday
        positionTF.text = HQUser.shareUser.position_name
    }
}
