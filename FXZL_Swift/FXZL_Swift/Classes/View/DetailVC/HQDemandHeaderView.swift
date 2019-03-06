//
//  HQDemandHeaderView.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandHeaderView: UIView, HQProtocol{

    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var vipV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var accessoryV: UIImageView!
    @IBOutlet weak var cerLabel: UILabel!
    
    @IBOutlet weak var supplyTypeLabel: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var demandTypeLabel: UILabel!
    @IBOutlet weak var demandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var readLabel: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyDesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func clickUserInfo(_ sender: UIButton) {
    }
    @IBAction func clickCompanyInfoButton(_ sender: UIButton) {
    }
}

extension HQDemandHeaderView {
    func layoutHeaderViewUserInfo(headerURL: String?,
                                  nickname: String?,
                                  position: String?,
                                  logo: String?,
                                  companyName: String?,
                                  des: String?,
                                  isVip: Bool,
                                  isCer: Bool) {
        headerImgV.hq_setImage(image: headerURL, placeholder: "ic_default_header")
        nameLabel.text = nickname;
        if position?.count == 0 {
            positionLabel.text = companyName
        }else {
            positionLabel.text = "\(position ?? "")" + "\(companyName ?? "")"
        }
        self.logo.hq_setImage(image: logo, placeholder: "ic_default_logo")
        
        companyNameLabel.text = companyName;
        companyDesLabel.text = des;
        vipV.isHidden = !isVip;
        cerLabel.isHidden = !isCer;
    }
    
    func layoutHeaderViewDemand(supplyType: String?,
                                supplyContent: String?,
                                demandType: String?,
                                demandContent: String?,
                                time: String?,
                                readNum: String) {
        supplyTypeLabel.text = supplyType;
        supplyLabel.text = supplyContent;
        demandTypeLabel.text = demandType;
        demandLabel.text = demandContent;
        timeLabel.text = time;
        readLabel.text = readNum;
    }
}

extension HQDemandHeaderView {
    class func headerHeight(supplyModel:HQSupplyModel?) -> CGFloat {
        guard let supplyModel = supplyModel else {
            return 0
        }
        var headerH: CGFloat = 0
        let topH: CGFloat = 20 + 90 + 20
        let gongH: CGFloat = 24 + 20
        var gongContentH: CGFloat = 0
        if let supply_content = supplyModel.supply_content {
            gongContentH = supply_content.heightWithFont(PingFangSCRegular(15), width: kScreenW - 40,lineSpace: 8)
        }
        let xuH: CGFloat = 24 + 25 + 20
        var xuContentH: CGFloat = 0
        if let demand_content = supplyModel.demand_content {
            xuContentH = demand_content.heightWithFont(PingFangSCRegular(15), width: kScreenW - 40,lineSpace: 8)
        }
        let bottomH: CGFloat = 20 + 1 + 15 + 13 + 15 + 10 + 98
        headerH = topH + gongH + gongContentH + xuH + xuContentH + bottomH
        return headerH
    }
}

