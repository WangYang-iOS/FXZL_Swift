//
//  HQUserDemandCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/7.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUserDemandCell: UITableViewCell {
    @IBOutlet weak var supplyTypeLabel: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var demandLabel: UILabel!
    @IBOutlet weak var demandTypeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var bottomH: NSLayoutConstraint!
    @IBOutlet weak var supplyH: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HQUserDemandCell {
    func layoutCell(type: Int?,
                    supplyType: String?,
                    supplyContent: String?,
                    demandType: String?,
                    demandContent: String?,
                    time: String?) {
        if type == 1 {
            supplyTypeLabel.text = supplyType;
            supplyLabel.text = supplyContent;
            topSpace.constant = 15;
            supplyH.constant = 18;
            bottomH.constant = 10;
        }else {
            supplyTypeLabel.text = "";
            supplyLabel.text = "";
            topSpace.constant = 0;
            supplyH.constant = 0;
            bottomH.constant = 0;
        }
        demandTypeLabel.text = demandType;
        demandLabel.text = demandContent;
        timeLabel.text = time;
    }
    
    class func cellHeight(model: HQSupplyModel?) -> CGFloat {
        guard var supplyModel = model else {
            return 0
        }
        if let cellHeight = supplyModel.cellHeight {
            return cellHeight
        }
        var gongH: CGFloat = 15 + 18 + 10
        var gongContentH: CGFloat = 0
        if let supply_content = supplyModel.supply_content {
            gongContentH = supply_content.heightWithFont(PingFangSCRegular(13), width: kScreenW - 40,lineSpace: 8)
        }
        if supplyModel.type == 2 {
            gongH = 0;
            gongContentH = 0;
        }
        let xuH: CGFloat = 15 + 18 + 10
        var xuContentH: CGFloat = 0
        if let demand_content = supplyModel.demand_content {
            xuContentH = demand_content.heightWithFont(PingFangSCRegular(13), width: kScreenW - 40,lineSpace: 8)
        }
        let bottomH: CGFloat = 18 + 12 + 15 + 1
        let cellHeight = gongH + gongContentH + xuH + xuContentH + bottomH
        supplyModel.cellHeight = cellHeight
        return cellHeight
    }
}


