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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var logoIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentH: NSLayoutConstraint!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var bottomSpace: NSLayoutConstraint!
    
    var mineVM = HQMineVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollW.constant = kScreenW
        topSpace.constant = kNavH
        AdjustmentBehavior(scrollView)
        self.hq_navigation.isHidden = true
        resetUserInfo()
        layoutContentView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mineVM.requesetUserInfo { (success) in
            if success {
                self.resetUserInfo()
            }
        }
    }
    
    func resetUserInfo() -> Void {
        if HQCommonTool.isLogin() {
            headerImgV.hq_setImage(image: HQUser.shareUser.avatar, placeholder: "ic_noLogin_header")
            nameLabel.text = HQUser.shareUser.nickname
            if let companyName = HQUser.shareUser.company_name,
                let positionName = HQUser.shareUser.position_name {
                positionLabel.text = companyName + " | " + positionName
            }else {
                positionLabel.text = "您的资料还没有完善哦"
            }
        }else {
            headerImgV.image = UIImage(named: "ic_noLogin_header")
            nameLabel.text = "未登录"
            positionLabel.text = "欢迎来到分享众联"
            logoIcon.isHidden = true
        }
    }
    
    @IBAction func clickUserButton(_ sender: UIButton) {
        navigationController?.pushViewController(HQUserInfoVC(), animated: true)
    }
    
}

extension HQMineVC {
    func layoutContentView() -> Void {
        let imgs = ["ic_mine_card","ic_mine_public","ic_mine_company","ic_mine_cer","ic_mine_setting"]
        let titles = ["我的名片","我的发布","我的公司","企业认证","个人设置"]
        let width : CGFloat = (kScreenW - 40) / 3.0
        let height : CGFloat = 105
        let line : Int = (titles.count + 3 - 1) / 3
        
//        _ = contentView.subviews.map {
//            $0.removeFromSuperview()
//        }
        
        for i in 0..<imgs.count {
            let X : CGFloat = CGFloat(i % 3) * width
            let Y : CGFloat = CGFloat(i / 3) * height
            var button = contentView.viewWithTag(1000 + i) as? UIButton
            if button == nil {
                button = UIButton(type: .custom)
                button?.frame = RECT(X, Y, width, height)
                button?.tag = 1000 + i
                button?.titleLabel?.font = PingFangSCRegular(13)
                button?.setTitleColor(UIColor.hexString(colorString: "2B3343"), for: .normal)
                contentView.addSubview(button!)
                button?.addTarget(self, action: #selector(clickCenterItem), for: .touchUpInside)
            }
            button?.setTitle(titles[i], for: .normal)
            button?.setImage(UIImage(named: imgs[i]), for: .normal)
            button?.layoutButton(style: .top, space: 20)
            contentH.constant = button?.getMaxY() ?? 0
        }
        
        for i in 0..<line {
            var label = contentView.viewWithTag(10000 + i) as? UILabel
            if label == nil {
                label = UILabel()
                label?.tag = 10000 + i
                label?.frame = RECT(0, CGFloat(i) * height, kScreenW - 40, kLineH)
                label?.backgroundColor = UIColor.hexString(colorString: "ebebeb")
                contentView.addSubview(label!)
            }
        }
        bottomSpace.constant = kScreenH - KTabH - kSafeBottom - 65 - 44 - 90 - 24 - contentH.constant + 1
    }
    
    @objc func clickCenterItem(_ button : UIButton) -> Void {
        //
        if !HQCommonTool.isLogin() {
            return
        }
        switch button.tag - 1000 {
        case 0:
            //
            let userVC = HQUserDetailVC()
            userVC.uuid = HQUser.shareUser.uuid
            navigationController?.pushViewController(userVC, animated: true)
            break
        case 1:
            //
            break
        case 2:
            //
            let vc = HQCompanyDetailVC()
            vc.cid = HQUser.shareUser.company_id
            navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            //
            break
        case 4:
            navigationController?.pushViewController(HQSettingVC(), animated: true)
            break
        default:
            break
        }
    }
}


