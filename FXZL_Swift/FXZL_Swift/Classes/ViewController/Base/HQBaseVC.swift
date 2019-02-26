//
//  HQBaseVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/25.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print(NSStringFromClass(self.classForCoder) + "被释放了")
    }
}
