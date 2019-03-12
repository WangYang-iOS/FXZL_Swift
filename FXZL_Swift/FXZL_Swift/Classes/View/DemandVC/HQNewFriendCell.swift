//
//  HQNewFriendCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/8.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

enum HQNewFriendCellType: Int {
    case newFriend = 0
    case newCircle = 1
    case circle = 2
}

class HQNewFriendCell: UITableViewCell {
    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    
    var cellType: HQNewFriendCellType = .newCircle {
        didSet{
            switch cellType {
            case .newFriend:
                headerImgView.cornerWithRadius(24)
                rightButton.setTitle("查看", for: .normal)
                rightButton.setTitle("已添加", for: .selected)
                break
            case .newCircle:
                headerImgView.cornerWithRadius(24)
                rightButton.setTitle("同意", for: .normal)
                rightButton.setTitle("已同意", for: .selected)
                break
            case .circle:
                headerImgView.addBorder(radius: 8, width: 1, color: "ebebeb")
                rightButton.setTitle("加入", for: .normal)
                rightButton.setTitle("已加入", for: .selected)
                break
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func clickButton(_ sender: UIButton) {
    }
    
}

extension HQNewFriendCell {
    func layoutCell(logo: String?,
                    name: String?,
                    des: String?,
                    showButton: Bool) -> Void {
        headerImgView.hq_setImage(image: logo, placeholder: nil)
        nameLabel.text = name
        desLabel.text = des
        rightButton.isHidden = !showButton
    }
    func layoutFriendCell(logo: String?,
                          name: String?,
                          des: String?,
                          state: String?) -> Void {
        headerImgView.hq_setImage(image: logo, placeholder: nil)
        nameLabel.text = name
        desLabel.text = des
        if state == "-1" {
            rightButton.setTitle("查看", for: .normal)
            rightButton.setTitleColor(UIColor.hexString(colorString: "1E6DFF"), for: .normal)
            rightButton.addBorder(radius: 5, width: 1, color: "1E6DFF")
        }else if state == "0" {
            rightButton.setTitle("已拒绝", for: .normal)
            rightButton.setTitleColor(UIColor.hexString(colorString: "B9BDC4"), for: .normal)
            rightButton.addBorder(radius: 5, width: 1, color: "ffffff")
        }else {
            rightButton.setTitle("已同意", for: .normal)
            rightButton.setTitleColor(UIColor.hexString(colorString: "B9BDC4"), for: .normal)
            rightButton.addBorder(radius: 5, width: 1, color: "ffffff")
        }
    }
}
