//
//  HQCompanyDetailVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCompanyDetailVC: HQBaseVC {
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var cid: Int? {
        didSet{
            companyVM.cid = cid
        }
    }
    var companyVM = HQCompanyDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hq_navigation.removeNavigationBarBottomLine(true)
        topSpace.constant = topSpaceConstant()
        AdjustmentBehavior(tableView)
        tableView.estimatedHeight()
        tableView.registerCellClass("UITableViewCell")
        tableView.registerCellNib("HQCompanyProductCell")
        tableView.registerCellNib("HQCompanySourceCell")
        tableView.registerHeaderFooterNib("HQHomeHeaderView")
        requestCompanyDetail()
    }
}

extension HQCompanyDetailVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 2) {
            return companyVM.companyDetailModel?.supply?.count ?? 0;
        }else {
            return 1;
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if companyVM.companyDetailModel?.supply?.count ?? 0 == 0 {
            return 2
        }
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HQCompanyProductCell", for: indexPath) as? HQCompanyProductCell
            cell?.layoutCell(product: companyVM.companyDetailModel?.company?.introduction,
                             address: companyVM.companyDetailModel?.company?.address,
                             website: companyVM.companyDetailModel?.company?.website)
            return cell!
        }else if indexPath.section == 1 {
            return UITableViewCell()
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HQCompanySourceCell", for: indexPath) as? HQCompanySourceCell
            let model = companyVM.companyDetailModel?.supply![indexPath.row]
            var time = (model?.create_dt ?? "") + " · " + "\(model?.view_num ?? 0)"
            time = time + "人浏览 · " + "\(model?.contact_num ?? 0)" + "人联系"
            cell?.layoutCell(headerURL: model?.avatar, nickname: model?.nickname, type: model?.type, supplyType: model?.supply_type, supplyContent: model?.supply_content, demandType: model?.demand_type, demandContent: model?.demand_content, time: time)
            return cell!
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let model = companyVM.companyDetailModel?.supply![indexPath.row]
            if model?.type == 1 {
                let vc = HQDemandDetailVC()
                vc.sid = model?.sid
                navigationController?.pushViewController(vc, animated: true)
            }else {
                //人脉详情
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return HQCompanyProductCell.cellHeight(model: companyVM.companyDetailModel?.company)
        }else if indexPath.section == 1 {
            return 170
        }
        return HQCompanySourceCell.cellHeight(model: companyVM.companyDetailModel?.supply![indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HQHomeHeaderView") as? HQHomeHeaderView
        headerView?.contentView.backgroundColor = UIColor.white
        headerView?.moreButton.isHidden = true
        switch section {
        case 0:
            //
            headerView?.layoutHeaderView(title: "公司介绍")
            if cid == HQUser.shareUser.company_id {
                headerView?.moreButton.isHidden = false
                headerView?.moreButton.setTitle("编辑", for: .normal)
            }
            break
        case 1:
            //
            headerView?.layoutHeaderView(title: "公司成员")
            break
        case 2:
            //
            headerView?.layoutHeaderView(title: "公司资源")
            break
        default:
            break
        }
        
        return headerView
    }
}

extension HQCompanyDetailVC {
    func requestCompanyDetail() {
        companyVM.requestCompanyDetail {[weak self] (success) in
            if success {
                self?.companyLogo.hq_setImage(image: self?.companyVM.logo, placeholder: kDefaultLogo)
                self?.companyLabel.text = self?.companyVM.name
                self?.tableView.reloadData()
            }
        }
    }
}
