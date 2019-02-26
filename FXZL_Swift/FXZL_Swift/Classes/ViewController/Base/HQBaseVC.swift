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
        self.hq_navigation.backgroundColor = UIColor.white;
        self.hq_navigation.leftButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.hq_navigation.rightButton.addTarget(self, action: #selector(clickRightButton), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print(NSStringFromClass(self.classForCoder) + "被释放了")
    }
    
    @objc func goBack() -> Void {
        navigationController?.popViewController(animated: true)
    }
    @objc func clickRightButton() -> Void {
        
    }
}
