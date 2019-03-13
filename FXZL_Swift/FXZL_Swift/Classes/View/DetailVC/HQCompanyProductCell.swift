//
//  HQCompanyProductCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/13.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCompanyProductCell: UITableViewCell {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        productLabel.font = PingFangSCRegular(15);
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension HQCompanyProductCell {
    func layoutCell(product: String?,
                    address: String?,
                    website: String?) -> Void {
        var dic = [NSAttributedStringKey:Any]()
        dic[NSAttributedStringKey.font] = PingFangSCRegular(15)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        dic[NSAttributedStringKey.paragraphStyle] = paragraphStyle
        
        let attributedStr = NSMutableAttributedString(string: product ?? "完善信息能让客户更好的了解您的公司～", attributes: dic)
        productLabel.attributedText = attributedStr;
        addressLabel.text = address?.count == 0 ? "未填写" : address;
        webLabel.text = website?.count == 0 ? "未填写" : website;
    }
    
    class func cellHeight(model: HQCompanyInfoModel?) -> CGFloat {
        guard var infoModel = model else {
            return 0
        }
        if let height = infoModel.cellHeight, height > CGFloat(0) {
            return height
        }
        let topSpace: CGFloat = 10
        let productH = infoModel.introduction?.heightWithFont(PingFangSCRegular(15), width: kScreenW - 40, lineSpace: 5) ?? 0
        let addressH = infoModel.address?.heightWithFont(PingFangSCRegular(15), width: kScreenW - 85, lineSpace: 5) ?? 0
        let urlH = infoModel.website?.heightWithFont(PingFangSCRegular(15), width: kScreenW - 85, lineSpace: 5) ?? 0
        
        var cellHeight = topSpace + productH + 15;
        cellHeight = cellHeight + addressH + 5 + urlH
        infoModel.cellHeight = cellHeight
        return cellHeight;
    }
    
}

