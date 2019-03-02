//
//  HQCirclePartCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCirclePartCell: UICollectionViewCell {

    @IBOutlet weak var userHeaderV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var joinButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func clickJoinButton(_ sender: UIButton) {
        
    }
    
    func layoutCell(headerURL: String?, name: String?, number: String?) -> Void {
        userHeaderV.hq_setImage(image: headerURL, placeholder: nil)
        nameLabel.text = name
        numberLabel.text = number
    }
}
