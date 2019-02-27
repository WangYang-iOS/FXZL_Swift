//
//  HQRegisterVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQRegisterVC: HQBaseVC {

    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var codeButton: UIButton!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var inviteCode = "" {
        didSet {
            registerVM.invite_code = inviteCode
        }
    }
    var registerVM = HQRegisterVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSpace.constant = 44 + kNavH
        phoneTF.limitCount = 11
    }
    @IBAction func clickCodeButton(_ sender: UIButton) {
        view.endEditing(true)
        registerVM.phone = phoneTF.text ?? ""
        registerVM.sendCodeRequest { (success) in
            if success {
                
            }
        }
    }
    @IBAction func clickRegisterButton(_ sender: UIButton) {
        view.endEditing(true)
        registerVM.phone = phoneTF.text ?? ""
        registerVM.code = codeTF.text ?? ""
        registerVM.password = passwordTF.text ?? ""
        registerVM.registerRequest { (success, responseMessage) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func clickProtocolButton(_ sender: UIButton) {
        view.endEditing(true)
    }
    
}
