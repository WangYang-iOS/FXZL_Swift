//
//  HQBaseVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/25.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class HQBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.hq_navigation.backgroundColor = UIColor.white;
        self.hq_navigation.leftButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.hq_navigation.rightButton.addTarget(self, action: #selector(clickRightButton), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardEnable(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print(NSStringFromClass(self.classForCoder) + "被释放了")
    }
    
    @objc func goBack() -> Void {
        view.endEditing(true)
        navigationController?.popViewController(animated: true)
    }
    @objc func clickRightButton() -> Void {
        
    }
    
    /// 是否使用IQKeyboardManager
    ///
    /// - Parameter enable: enable
    func keyboardEnable(_ enable: Bool) -> Void {
        //是否使用IQKeyboardManager
        IQKeyboardManager.shared.enable = enable
        //隐藏工具栏
        IQKeyboardManager.shared.enableAutoToolbar = false
        //点击空白区域隐藏键盘
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
}
