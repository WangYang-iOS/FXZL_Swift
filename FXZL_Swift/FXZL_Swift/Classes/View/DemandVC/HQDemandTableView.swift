//
//  HQDemandTableView.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandTableView: UITableView {
    
    var dataArray: [HQSupplyModel]? {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        self.estimatedHeight()
        self.registerCellNib("HQDemandCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HQDemandTableView: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HQDemandCell", for: indexPath) as? HQDemandCell
        let supplyModel = dataArray![indexPath.row]
        cell?.layoutCellUserInfo(headerURL: supplyModel.avatar,
                                 name: supplyModel.nickname,
                                 position: supplyModel.position_name,
                                 companyName: supplyModel.company_name,
                                 isVip: supplyModel.vip_state == 1,
                                 isCer: true,
                                 isFriend: supplyModel.is_friend == 1,
                                 isSelf: supplyModel.uuid == HQUser.shareUser.uuid)
        
        var time = supplyModel.create_dt ?? "" + " · " + "\(supplyModel.view_num ?? 0)"
        time = time + "人浏览 · " + "\(supplyModel.contact_num ?? 0)" + "人联系"
        cell?.layoutCellSuppleyDemand(supplyType: supplyModel.supply_type,
                                      supplyContent: supplyModel.supply_content,
                                      demandType: supplyModel.demand_type,
                                      demandContent: supplyModel.demand_content,
                                      time: time)
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HQDemandCell.cellHeightWithModel(supplyModel: dataArray?[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
