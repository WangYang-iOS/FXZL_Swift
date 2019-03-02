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
        bottomSpace.constant = KTabH + kSafeBottom
        tableView.isHidden = true
        tableView.estimatedHeight()
        tableView.registerCellNib("HQUserInfoCell")
        tableView.registerCellNib("HQDemandCell")
        tableView.registerHeaderFooterNib("HQHomeHeaderView")
        HQCircleCell.registerCellNib(tableView: tableView)
        AdjustmentBehavior(tableView)
        
        requestHomeData()
    }
}

extension HQHomeVC : UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.homeVM.homeModel?.members?.count ?? 0
        case 1:
            if let circles = self.homeVM.homeModel?.circles, circles.count == 0 {
                return 0
            }else {
                return 1
            }
        case 2:
            return self.homeVM.homeModel?.supply_demands?.count ?? 0
        default:
            return 0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            //
            let cell = tableView.dequeueReusableCell(withIdentifier: "HQUserInfoCell", for: indexPath) as? HQUserInfoCell
            let memberModel = self.homeVM.homeModel?.members![indexPath.row]
            cell?.layoutCell(headerURL: memberModel?.avatar,
                             name: memberModel?.nickname,
                             position: memberModel?.position_name,
                             companyName: memberModel?.company_name,
                             industry: memberModel?.industry_name,
                             isVip: memberModel?.vip_state == 1,
                             isCer: memberModel?.authen_state == "1",
                             isFriend: memberModel?.is_friend == 1,
                             isSelf: memberModel?.uuid == HQUser.shareUser.uuid)
            return cell!
        case 1:
            //
            let cell = tableView.dequeueReusableCell(withIdentifier: "HQCircleCell", for: indexPath) as? HQCircleCell
            cell?.dataArray = self.homeVM.homeModel?.circles
            return cell!
        case 2:
            //
            let cell = tableView.dequeueReusableCell(withIdentifier: "HQDemandCell", for: indexPath) as? HQDemandCell
            let supplyModel = self.homeVM.homeModel?.supply_demands![indexPath.row]
            cell?.layoutCellUserInfo(headerURL: supplyModel?.avatar,
                                     name: supplyModel?.nickname,
                                     position: supplyModel?.position_name,
                                     companyName: supplyModel?.company_name,
                                     isVip: supplyModel?.vip_state == 1,
                                     isCer: true,
                                     isFriend: supplyModel?.is_friend == 1,
                                     isSelf: supplyModel?.uuid == HQUser.shareUser.uuid)
            
            var time = supplyModel?.create_dt ?? "" + " · " + "\(supplyModel?.view_num ?? 0)"
            time = time + "人浏览 · " + "\(supplyModel?.contact_num ?? 0)" + "人联系"
            cell?.layoutCellSuppleyDemand(supplyType: supplyModel?.supply_type,
                                          supplyContent: supplyModel?.supply_content,
                                          demandType: supplyModel?.demand_type,
                                          demandContent: supplyModel?.demand_content,
                                          time: time)
            return cell!
        
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return HQUserInfoCell.cellHeightWithModel(memberModel: self.homeVM.homeModel?.members![indexPath.row])
        case 1:
            if let circles = self.homeVM.homeModel?.circles, circles.count == 0 {
                return 0.01
            }
            return 225
        case 2:
            return HQDemandCell.cellHeightWithModel(supplyModel: self.homeVM.homeModel?.supply_demands![indexPath.row])
        default:
            return 0.01
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HQHomeHeaderView") as? HQHomeHeaderView
        headerView?.contentView.backgroundColor = UIColor.white
        headerView?.moreButton.isHidden = false
        switch section {
        case 0:
            //
            headerView?.layoutHeaderView(title: "推荐去认识")
            headerView?.moreButton.isHidden = true
            break
        case 1:
            //
            headerView?.layoutHeaderView(title: "推荐圈子")
            break
        case 2:
            //
            headerView?.layoutHeaderView(title: "供需雷达")
            break
        default:
            break
        }
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
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
            if let banners = self?.homeVM.homeModel?.banners, banners.count > 0 {
                self?.headerView.frame = RECT(0, 0, kScreenW, 9 / 16.0 * kScreenW)
                let bannerModel = self?.homeVM.homeModel?.banners?.first
                self?.headerImgV.hq_setImage(image: bannerModel?.pic, placeholder: nil)
            }else {
                self?.headerView.frame = RECT(0, 0, kScreenW, 0)
            }
            
            self?.tableView.isHidden = false
            self?.tableView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - Interface
extension HQHomeVC {
    @objc func goSearchVC() -> Void {
        //
    }
}
