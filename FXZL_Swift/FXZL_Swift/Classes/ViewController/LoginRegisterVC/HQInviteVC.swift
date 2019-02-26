//
//  HQInviteVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQInviteVC: HQBaseVC {

    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var inviteTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
    }
    @IBAction func clickInviteButton(_ sender: UIButton) {
    }
    
}
