//
//  HQUserInfoCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQUserInfoCell: UITableViewCell {
    @IBOutlet weak var headerImgV: UIImageView!
    @IBOutlet weak var vipV: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var cerLabel: UILabel!
    @IBOutlet weak var industryLabel1: UILabel!
    @IBOutlet weak var industryLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func clickApplybutton(_ sender: UIButton) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HQUserInfoCell {
    
    func layoutCell(headerURL: String?,
                    name: String?,
                    position: String?,
                    companyName: String?,
                    industry: String?,
                    isVip: Bool?,
                    isCer: Bool?,
                    isFriend: Bool?,
                    isSelf: Bool?) -> Void {
        headerImgV.hq_setImage(image: headerURL, placeholder: kDefaultUserHeader)
        nameLabel.text = name
        positionLabel.text = position
        companyNameLabel.text = companyName
        vipV.isHidden = !(isVip ?? false)
        cerLabel.isHidden = !(isCer ?? false)
        
        if let industry = industry, industry.count > 0 {
            tagView.isHidden = false
            let array = industry.components(separatedBy: ",")
            if array.count > 1 {
                industryLabel1.text = array.first
                industryLabel2.text = array.last
                industryLabel2.isHidden = false
            }else {
                industryLabel1.text = array.first
                industryLabel2.isHidden = true
            }
        }else {
            tagView.isHidden = true
        }
        
        rightButton.isHidden = isSelf ?? false
        if isFriend ?? false {
            rightButton.setTitle("联系Ta", for: .normal)
        }else {
            rightButton.setTitle("认识Ta", for: .normal)
        }
    }
    
    
    class func cellHeightWithModel(memberModel: HQMemberModel?) -> CGFloat {
        guard var memberModel = memberModel else {
            return 0
        }
        if let cellHeight = memberModel.cellHeight {
            return cellHeight
        }
        var cellHeight: CGFloat = 0
        let topH: CGFloat = 40 + 19
        var tagH: CGFloat = 32
        let lineH: CGFloat = 1 + 18
        guard let industry_name = memberModel.industry_name, industry_name.count > 0 else {
            tagH = 0
            cellHeight = topH + tagH + lineH
            memberModel.cellHeight = cellHeight
            return cellHeight
        }
        if industry_name.components(separatedBy: ",").count == 0 {
            tagH = 0
            cellHeight = topH + tagH + lineH
            memberModel.cellHeight = cellHeight
            return cellHeight
        }
        cellHeight = topH + tagH + lineH
        memberModel.cellHeight = cellHeight
        return cellHeight
    }
}
