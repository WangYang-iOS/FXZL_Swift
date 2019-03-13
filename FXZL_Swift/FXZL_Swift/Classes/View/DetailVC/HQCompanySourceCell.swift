//
//  HQCompanySourceCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/13.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCompanySourceCell: UITableViewCell {

    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var supplyTypeLabel: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var demandTypeLabel: UILabel!
    @IBOutlet weak var demandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var supplyH: NSLayoutConstraint!
    @IBOutlet weak var bottomH: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        supplyLabel.font = PingFangSCRegular(13);
        supplyLabel.textColor = UIColor.hexString(colorString: "666C77")
        demandLabel.font = PingFangSCRegular(13);
        demandLabel.textColor = UIColor.hexString(colorString: "666C77")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HQCompanySourceCell {
    func layoutCell(headerURL: String?,
                    nickname: String?,
                    type: Int?,
                    supplyType: String?,
                    supplyContent: String?,
                    demandType: String?,
                    demandContent: String?,
                    time: String?) -> Void {
        headerImgV.hq_setImage(image: headerURL, placeholder: kDefaultUserHeader)
        nameLabel.text = nickname
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
        var cellHeight: CGFloat = 0
        
        if supplyModel.cellHeight ?? 0 > CGFloat(0) {
            cellHeight = supplyModel.cellHeight ?? 0
            return cellHeight
        }
        let userInfoH: CGFloat = 18 + 32
        var gongH: CGFloat = 15 + 18 + 10
        var gongContentH: CGFloat = (supplyModel.supply_content ?? "").heightWithFont(PingFangSCRegular(13), width: kScreenW - 40, lineSpace: 8)
        if supplyModel.type == 2 {
            gongH = 0;
            gongContentH = 0;
        }
        let xuH: CGFloat = 15 + 18 + 10;
        let xuContentH: CGFloat = (supplyModel.demand_content ?? "").heightWithFont(PingFangSCRegular(13), width: kScreenW - 40, lineSpace: 8)
        let bottomH: CGFloat = 18 + 12 + 15 + 1;
        cellHeight = userInfoH + gongH + gongContentH + xuH + xuContentH + bottomH;
        supplyModel.cellHeight = cellHeight;
        return cellHeight;
    }
}
