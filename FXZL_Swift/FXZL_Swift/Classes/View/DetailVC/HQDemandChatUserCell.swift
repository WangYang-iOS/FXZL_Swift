//
//  HQDemandChatUserCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandChatUserCell: UITableViewCell {

    @IBOutlet weak var leftSpace: NSLayoutConstraint!
    @IBOutlet weak var lineLeftSpace: NSLayoutConstraint!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var headerImageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    var showSelectButton: Bool = false {
        didSet{
            leftSpace.constant = showSelectButton ? 0 : -24
            selectButton.isHidden = !showSelectButton
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftSpace.constant = -24;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func clickButton(_ sender: UIButton) {
        
    }
}

extension HQDemandChatUserCell {
    func showBottomLine(hidden:Bool, leftSpace:CGFloat) -> Void {
        lineView.isHidden = !hidden
        lineLeftSpace.constant = leftSpace
    }
    
    func layoutCell(headerURL: String?, title: String?, subTitle: String?, isSelected: Bool = false) -> Void {
        if headerURL == "ic_newFriend" {
            headerImageV.image = UIImage(named: "headerURL");
        }else {
            headerImageV.hq_setImage(image: headerURL, placeholder: kDefaultUserHeader)
        }
        nameLabel.text = title;
        timeLabel.text = subTitle;
        selectButton.isSelected = isSelected;
    }
}
