//
//  HQDemandCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandCell: UITableViewCell {

    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var vipV: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var cerLabel: UILabel!
    @IBOutlet weak var supplyTypeLabel: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var demandTypeLabel: UILabel!
    @IBOutlet weak var demandLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func clickUserInfoButton(_ sender: UIButton) {
    }
}

extension HQDemandCell {
    func layoutCellUserInfo(headerURL: String?,
                            name: String?,
                            position: String?,
                            companyName: String?,
                            isVip: Bool?,
                            isCer: Bool?,
                            isFriend: Bool?,
                            isSelf: Bool?) -> Void {
        headerImgV.hq_setImage(image: headerURL, placeholder: "ic_default_header")
        nameLabel.text = name
        positionLabel.text = position
        companyNameLabel.text = companyName
        vipV.isHidden = !(isVip ?? false)
        cerLabel.isHidden = !(isCer ?? false)
        rightButton.isHidden = isSelf ?? false
        if isFriend ?? false {
            rightButton.setTitle("联系Ta", for: .normal)
        }else {
            rightButton.setTitle("认识Ta", for: .normal)
        }
    }
    func layoutCellSuppleyDemand(supplyType: String?,
                                 supplyContent: String?,
                                 demandType: String?,
                                 demandContent: String?,
                                 time: String?) -> Void {
        supplyTypeLabel.text = supplyType
        supplyLabel.text = supplyContent
        demandTypeLabel.text = demandType
        demandLabel.text = demandContent
        timeLabel.text = time
    }
    
}

extension HQDemandCell {
    class func cellHeightWithModel(supplyModel: HQSupplyModel?) -> CGFloat {
        guard var supplyModel = supplyModel else {
            return 0
        }
        if let cellHeight = supplyModel.cellHeight {
            return cellHeight
        }
        let userInfoH: CGFloat = 19 + 40
        let gongH: CGFloat = 18 + 14 + 6
        var gongContentH: CGFloat = 0
        if let supply_content = supplyModel.supply_content {
            gongContentH = supply_content.heightWithFont(PingFangSCRegular(13), width: kScreenW - 68 - 30,lineSpace: 8)
        }
        let xuH: CGFloat = 18 + 13 + 6
        var xuContentH: CGFloat = 0
        if let demand_content = supplyModel.demand_content {
            xuContentH = demand_content.heightWithFont(PingFangSCRegular(13), width: kScreenW - 68 - 30,lineSpace: 8)
        }
        let bottomH: CGFloat = 18 + 12 + 16 + 1
        let cellHeight = userInfoH + gongH + gongContentH + xuH + xuContentH + bottomH
        supplyModel.cellHeight = cellHeight
        return cellHeight
    }
}
