//
//  HQHomeVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQHomeVC: HQBaseVC {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomSpace: NSLayoutConstraint!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerImgV: UIImageView!

    var searchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = RECT(0, 0, kScreenW - 30, 28)
        button.setTitle("请输入您要搜索的内容", for: .normal)
        button.setImage(UIImage(named: "ic_search"), for: .normal)
        button.cornerWithRadius(4)
        button.titleLabel?.font = PingFangSCRegular(14)
        button.backgroundColor = UIColor.hexString(colorString: "ffffff", alpha: 0.3)
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(goSearchVC), for: .touchUpInside)
        return button
    }()
    
    var homeVM = HQHomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hq_navigation.backgroundColor = UIColor.hexString(colorString: "1E6DFF", alpha: 0)
        self.hq_navigation.hiddenLeftButton = true
        self.hq_navigation.titleView = searchButton
        self.hq_navigation.removeNavigationBarBottomLine(true)
        tableView.estimatedHeight()
        tableView.registerCellClass("UITableViewCell")
        self.headerView.backgroundColor = UIColor.red
        self.headerView.frame = RECT(0, 0, kScreenW, 9 / 16.0 * kScreenW)
        
        requestHomeData()
    }
}

extension HQHomeVC : UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        self.hq_navigation.isHidden = contentOffset.y < CGFloat(0) ? true : false
        self.hq_navigation.backgroundColor = UIColor.hexString(colorString: "1E6DFF", alpha: contentOffset.y / kNavH)
    }
}

// MARK: - PravateMethods
extension HQHomeVC {
    func requestHomeData() -> Void {
        self.homeVM.requestHomeInfo {[weak self] (success) in
            let bannerModel = self?.homeVM.homeModel?.banners?.first
            self?.headerImgV.hq_setImage(image: bannerModel?.pic, placeholder: nil)
        }
    }
}

// MARK: - Interface
extension HQHomeVC {
    @objc func goSearchVC() -> Void {
        //
    }
}
