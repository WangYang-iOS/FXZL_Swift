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
        topSpace.constant = 44 + topSpaceConstant()
        self.hq_navigation.removeNavigationBarBottomLine(true)
    }
    @IBAction func clickInviteButton(_ sender: UIButton) {
        view.endEditing(true)
        if inviteTF.text?.count == 0 {
            return
        }
        HQNetworkManager.postRequest(urlString: "api/V1/Member/CheckInvitCode", params: ["invit_code":inviteTF.text!]) { [weak self] (success, responseMessage) in
            if success {
                let registerVC = HQRegisterVC()
                registerVC.inviteCode = (self?.inviteTF.text)!
                self?.navigationController?.pushViewController(registerVC, animated: true)
            }
        }
    }
}
