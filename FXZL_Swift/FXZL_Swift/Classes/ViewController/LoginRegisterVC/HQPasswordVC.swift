//
//  HQPasswordVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQPasswordVC: HQBaseVC {

    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var codeButton: UIButton!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
        phoneTF.limitCount = 11
    }
    @IBAction func clickSureButton(_ sender: UIButton) {
    }
    
}
