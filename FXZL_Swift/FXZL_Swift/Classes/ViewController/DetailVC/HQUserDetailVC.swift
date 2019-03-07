//
//  HQUserDetailVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/7.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUserDetailVC: HQBaseVC {
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomH: NSLayoutConstraint!
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var userHeaderV: UIImageView!
    @IBOutlet weak var vipV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var accessV: UIImageView!
    @IBOutlet weak var cerLabel: UILabel!
    @IBOutlet weak var logoV: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyDesLabel: UILabel!
    
    var uuid: String? {
        didSet{
            userInfoVM.uuid = uuid
        }
    }
    var userInfoVM = HQUserDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hq_navigation.title = "个人详情"
        topSpace.constant = topSpaceConstant()
        AdjustmentBehavior(tableView)
        tableView.estimatedHeight()
        tableView.registerCellClass("UITableViewCell")
        tableView.registerCellNib("HQUserDemandCell")
        tableView.registerHeaderFooterNib("HQHomeHeaderView")
        requestUserInfo()
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        
    }
    @IBAction func clickUserInfoButton(_ sender: UIButton) {
        navigationController?.pushViewController(HQUserInfoVC(), animated: true)
    }
    @IBAction func clickCompanyInfoButton(_ sender: UIButton) {
        
    }
}

extension HQUserDetailVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 && userInfoVM.userInfo?.circles?.cid ?? 0 > 0 {
            if section == 0 {
                return userInfoVM.userInfo?.supply_demand?.count ?? 0
            }else {
                return 1
            }
        }else {
            if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 {
                return userInfoVM.userInfo?.supply_demand?.count ?? 0
            }else {
                return 1
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        var section = 0
        if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 {
            section += 1
        }
        if userInfoVM.userInfo?.circles?.cid ?? 0 > 0 {
            section += 1
        }
        return section
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 && userInfoVM.userInfo?.circles?.cid ?? 0 > 0 {
            if indexPath.section == 0 {
                return self.demandCell(tableView:tableView, indexPath:indexPath)
            }else {
                return UITableViewCell()
            }
        }else {
            if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 {
                return self.demandCell(tableView:tableView, indexPath:indexPath)
            }else {
                return UITableViewCell()
            }
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 && userInfoVM.userInfo?.circles?.cid ?? 0 > 0 {
            if indexPath.section == 0 {
                return HQUserDemandCell.cellHeight(model:self.userInfoVM.userInfo?.supply_demand![indexPath.row])
            }else {
                return 80
            }
        }else {
            if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 {
                return HQUserDemandCell.cellHeight(model:self.userInfoVM.userInfo?.supply_demand![indexPath.row])
            }else {
                return 80
            }
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HQHomeHeaderView") as? HQHomeHeaderView
        headerView?.contentView.backgroundColor = UIColor.white
        headerView?.moreButton.isHidden = true
        switch section {
        case 0:
            //
            headerView?.layoutHeaderView(title: "供需信息")
            break
        case 1:
            //
            headerView?.layoutHeaderView(title: "我的圈子")
            break
        default:
            break
        }
        if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 && userInfoVM.userInfo?.circles?.cid ?? 0 > 0 {
            if section == 0 {
                headerView?.layoutHeaderView(title: "供需信息")
            }else {
                if userInfoVM.uuid == HQUser.shareUser.uuid {
                    headerView?.layoutHeaderView(title: "我的圈子")
                }else {
                    headerView?.layoutHeaderView(title: "Ta的圈子")
                }
            }
        }else {
            if userInfoVM.userInfo?.supply_demand?.count ?? 0 > 0 {
                headerView?.layoutHeaderView(title: "供需信息")
            }else {
                if userInfoVM.uuid == HQUser.shareUser.uuid {
                    headerView?.layoutHeaderView(title: "我的圈子")
                }else {
                    headerView?.layoutHeaderView(title: "Ta的圈子")
                }
            }
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}


// MARK: - request
extension HQUserDetailVC {
    func requestUserInfo() -> Void {
        userInfoVM.requestUserInfo { [weak self] (success) in
            if success {
                let member = self?.userInfoVM.userInfo?.member
                
                self?.layoutHeaderViewUserInfo(headerURL: member?.avatar,
                                               nickname: member?.nickname,
                                               position: member?.position_name,
                                               isVip: member?.vip_state == 1,
                                               showAccessory: member?.uuid == HQUser.shareUser.uuid,
                                               isCer: member?.authen_state == "1")
                if let companyName = member?.company_name, companyName.count > 0 {
                    let des = "\(self?.userInfoVM.userInfo?.count_members ?? 0)" + " 成员 · " + "\(self?.userInfoVM.userInfo?.count_supplys ?? 0)" + " 供需"
                    self?.layoutHeaderViewCompanyInfo(companyName: member?.company_name,
                                                      logo: member?.logo,
                                                      des: des)
                }else {
                    self?.headerView.frame = RECT(0, 0, kScreenW, 20 + 90 + 12)
                    self?.tableView.tableHeaderView = self?.headerView
                }
                if member?.uuid == HQUser.shareUser.uuid {
                    self?.bottomH.constant = 0
                }else {
                    self?.bottomH.constant = 70
                    if self?.userInfoVM.userInfo?.is_friend == 1 {
                        self?.bottomButton.setTitle("发消息", for: .normal)
                    }else {
                        self?.bottomButton.setTitle("申请好友", for: .normal)
                    }
                }
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - Pravate Methods
extension HQUserDetailVC {
    func layoutHeaderViewUserInfo(headerURL: String?,
                                  nickname: String?,
                                  position: String?,
                                  isVip: Bool?,
                                  showAccessory: Bool?,
                                  isCer: Bool?) {
        userHeaderV.hq_setImage(image: headerURL, placeholder: kDefaultUserHeader)
        nameLabel.text = nickname;
        positionLabel.text = position;
        vipV.isHidden = !(isVip ?? false);
        accessV.isHidden = !(showAccessory ?? true);
        cerLabel.isHidden = !(isCer ?? false);
    }
    
    func layoutHeaderViewCompanyInfo(companyName: String?,
                                     logo: String?,
                                     des: String?) {
        companyNameLabel.text = companyName;
        logoV.hq_setImage(image: logo, placeholder: kDefaultLogo)
        companyDesLabel.text = des;
    }
    
    func demandCell(tableView: UITableView, indexPath: IndexPath) -> HQUserDemandCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HQUserDemandCell", for: indexPath) as? HQUserDemandCell
        
        let supplyModel = userInfoVM.userInfo?.supply_demand![indexPath.row]
        var time = supplyModel?.create_dt ?? "" + " · " + "\(supplyModel?.view_num ?? 0)" + "人浏览 · "
        time = time  + "\(supplyModel?.contact_num ?? 0)" + "人联系"
        
        cell?.layoutCell(type: supplyModel?.type, supplyType: supplyModel?.supply_type, supplyContent: supplyModel?.supply_content, demandType: supplyModel?.demand_type, demandContent: supplyModel?.demand_content, time: time)
        return cell!
    }
}

