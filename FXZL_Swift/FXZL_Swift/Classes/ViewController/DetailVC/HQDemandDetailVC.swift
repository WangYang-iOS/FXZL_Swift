//
//  HQDemandDetailVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandDetailVC: HQBaseVC {
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var bottomH: NSLayoutConstraint!
    lazy var headerView: HQDemandHeaderView = {
        let headerView = HQDemandHeaderView.loadNib()
        return headerView
    }()
    var sid: Int?{
        didSet{
            demandVM.sid = sid
        }
    }
    var demandVM = HQDemandVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hq_navigation.title = "供需详情"
        topSpace.constant = topSpaceConstant()
        AdjustmentBehavior(tableView)
        tableView.estimatedHeight()
        tableView.registerCellClass("UITableViewCell")
//        tableView.registerHeaderFooterClass("HQDemandHeaderFooterView")
        tableView.register(HQDemandHeaderFooterView.classForCoder(), forHeaderFooterViewReuseIdentifier: "HQDemandHeaderFooterView")
        requestDetailData()
    }
}

extension HQDemandDetailVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demandVM.demandDetailModel?.contacts?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
//        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSectionView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HQDemandHeaderFooterView") as? HQDemandHeaderFooterView
        headerSectionView?.frame = RECT(0, 0, kScreenW, 60)
        headerSectionView?.titleLabel.text = "已沟通 · " + "\(demandVM.demandDetailModel?.contacts?.count ?? 0)"
        return headerSectionView
    }
}

extension HQDemandDetailVC {
    func requestDetailData() -> Void {
        demandVM.requestDemandDetailVC {[weak self] (success) in
            if success {
                if let supplyModel = self?.demandVM.demandDetailModel?.supply_demand {
                    let des = "\(self?.demandVM.demandDetailModel?.count_members ?? 0)" + " 成员 · " + "\(self?.demandVM.demandDetailModel?.count_supplys ?? 0)" + " 供需"
                    self?.headerView.layoutHeaderViewUserInfo(headerURL: supplyModel.avatar,
                                                              nickname: supplyModel.nickname,
                                                              position: supplyModel.position_name,
                                                              logo: supplyModel.logo,
                                                              companyName: supplyModel.company_name,
                                                              des: des,
                                                              isVip: supplyModel.vip_state == 1,
                                                              isCer: true)
                    self?.headerView.layoutHeaderViewDemand(supplyType: supplyModel.supply_type,
                                                            supplyContent: supplyModel.supply_content,
                                                            demandType: supplyModel.demand_type,
                                                            demandContent: supplyModel.demand_content,
                                                            time: supplyModel.create_dt,
                                                            readNum: "\(supplyModel.view_num ?? 0)" + "人浏览")
                    self?.headerView.frame = RECT(0, 0, 0, HQDemandHeaderView.headerHeight(supplyModel: supplyModel))
                    self?.tableView.tableHeaderView = self?.headerView
                    
                    if supplyModel.uuid == HQUser.shareUser.uuid {
                        self?.bottomH.constant = 0;
                    }else {
                        self?.bottomH.constant = 70;
                        if supplyModel.is_friend == 1 {
                            self?.bottomButton.setTitle("联系Ta", for: .normal)
                        }else {
                            self?.bottomButton.setTitle("认识Ta", for: .normal)
                        }
                    }
                }
                self?.tableView.reloadData()
            }
        }
    }
}
