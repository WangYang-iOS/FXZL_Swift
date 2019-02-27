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
    
    var passwordVM = HQPasswordVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
        phoneTF.limitCount = 11
    }
    @IBAction func clickCodeButton(_ sender: UIButton) {
        view.endEditing(true)
        passwordVM.phone = phoneTF.text ?? ""
        passwordVM.sendCodeRequest { (success) in
            if success {
                
            }
        }
    }
    @IBAction func clickSureButton(_ sender: UIButton) {
        view.endEditing(true)
        passwordVM.phone = phoneTF.text ?? ""
        passwordVM.code = codeTF.text ?? ""
        passwordVM.password = passwordTF.text ?? ""
        passwordVM.passwordRequest { [weak self] (success, responseMessage) in
            if success {
                print("密码找回成功，请重新登录")
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
