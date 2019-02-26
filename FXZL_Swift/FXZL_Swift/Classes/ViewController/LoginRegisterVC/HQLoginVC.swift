//
//  HQLoginVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQLoginVC: HQBaseVC {

    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
        phoneTF.limitCount = 11
    }
    @IBAction func clickLoginButton(_ sender: UIButton) {
    }
    @IBAction func clickForgetButton(_ sender: UIButton) {
        navigationController?.pushViewController(HQPasswordVC(), animated: true)
    }
    
}
