//
//  HQHomeVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQHomeVC: HQBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(HQNavigationController(rootViewController: HQLoginVC()), animated: true, completion: nil)
    }
    
}
