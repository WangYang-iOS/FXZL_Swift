//
//  HQSettingVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQSettingVC: HQBaseVC {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    
    let dataArray = [["消息设置","清理缓存"],["意见反馈","关于我们","去评分"],["退出登录"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = topSpaceConstant()
        hq_navigation.title = "设置"
        tableView.estimatedHeight()
        tableView.registerCellNib("HQSettingCell")
    }

}

extension HQSettingVC : UITableViewDelegate, UITableViewDataSource {

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HQSettingCell", for: indexPath) as! HQSettingCell
        cell.layoutCell(title: dataArray[indexPath.section][indexPath.row], subTitle: "")
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        if dataArray[indexPath.section][indexPath.row] == "退出登录" {
            HQUser.shareUser.reset()
            HQCommonMethods.removeValue(kUUIDKey)
            HQCommonMethods.removeValue(kPasswordKey)
            NotificationCenter.default.post(name: NSNotification.Name(HQLoginNotificationName), object: nil)
            navigationController?.popToRootViewController(animated: true)
            tabBarController?.selectedIndex = 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
