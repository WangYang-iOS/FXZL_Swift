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
    
    private var loginVM = HQLoginVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
        phoneTF.limitCount = 11
        self.hq_navigation.hiddenLeftButton = true
        self.hq_navigation.rightButtonTitle = "注册"
        
    }
    @IBAction func clickLoginButton(_ sender: UIButton) {
        view.endEditing(true)
        loginVM.requestLoginAPi { (result) in
            print("\(result)")
            if result {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func clickForgetButton(_ sender: UIButton) {
        view.endEditing(true)
        navigationController?.pushViewController(HQPasswordVC(), animated: true)
    }
    override func clickRightButton() {
        view.endEditing(true)
        navigationController?.pushViewController(HQInviteVC(), animated: true)
    }
}
