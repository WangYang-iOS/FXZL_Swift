//
//  HQConnectCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/6.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQConnectCell: UITableViewCell {
    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var vipV: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var cerLabel: UILabel!
    @IBOutlet weak var demandTypeLabel: UILabel!
    @IBOutlet weak var demandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HQConnectCell {
    func layoutCellUserInfo(headerURL: String?,
                            nickname: String?,
                            position: String?,
                            companyName: String?,
                            isVip: Bool?,
                            isCer: Bool?) -> Void {
        headerImgV.hq_setImage(image: headerURL, placeholder: kDefaultUserHeader)
        nameLabel.text = nickname
        positionLabel.text = position
        companyNameLabel.text = companyName
        vipV.isHidden = !(isVip ?? false)
        cerLabel.isHidden = !(isCer ?? false)
    }
    func layoutCellSuppleyDemand(demandType: String?,
                                 demandContent: String?,
                                 time: String?,
                                 money: CGFloat?) -> Void {
        demandTypeLabel.text = demandType
        demandLabel.text = demandContent
        timeLabel.text = time
        if money ?? 0 == 0 {
            self.rightButton.isHidden = true;
        }else {
            self.rightButton.isHidden = false;
        }
        rightButton.setTitle("\(money ?? 0)", for: .normal)
    }
}

extension HQConnectCell {
    class func cellHeightWithModel(supplyModel: HQSupplyModel?) -> CGFloat {
        guard var supplyModel = supplyModel else {
            return 0
        }
        if let cellHeight = supplyModel.cellHeight {
            return cellHeight
        }
        let userInfoH: CGFloat = 20 + 40
        let xuH: CGFloat = 18 + 17 + 5
        var xuContentH: CGFloat = 0
        if let demand_content = supplyModel.demand_content {
            xuContentH = demand_content.heightWithFont(PingFangSCRegular(13), width: kScreenW - 68 - 30,lineSpace: 8)
        }
        let bottomH: CGFloat = 18 + 12 + 16 + 1
        let cellHeight = userInfoH + xuH + xuContentH + bottomH
        supplyModel.cellHeight = cellHeight
        return cellHeight
    }
}

