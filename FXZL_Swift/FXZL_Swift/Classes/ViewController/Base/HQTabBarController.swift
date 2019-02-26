//
//  HQTabBarController.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let classNames = ["HQHomeVC","HQDemandVC","HQCircleVC","HQMessageVC","HQMineVC"]
        let titles = ["首页","供需","圈子","消息","我的"]
        let normalImgs = ["ic_tabbar_1","ic_tabbar_2","ic_tabbar_3","ic_tabbar_4","ic_tabbar_5"]
        let selectImgs = ["ic_tabbar_select_1","ic_tabbar_select_2","ic_tabbar_select_3","ic_tabbar_select_4","ic_tabbar_select_5"]
        
        for i in 0..<classNames.count {
            let nav = getNavigationController(normalImg: normalImgs[i], selectImg: selectImgs[i], title: titles[i], vcName: classNames[i])
            addChildViewController(nav)
        }
        self.tabBar.barTintColor = UIColor.white
    }
    
    func getNavigationController(normalImg:String,selectImg:String,title:String,vcName:String) -> HQNavigationController {
        let vc = NSClassFromString(kSpaceName + "." + vcName) as! HQBaseVC.Type
        let viewContrller = vc.init()
        let nav = HQNavigationController.init(rootViewController: viewContrller)
        let tabbarItem = UITabBarItem(title: title, image: UIImage(named: normalImg)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal))
        let selectColor = UIColor.hexString(colorString: "1E6DFF")
        let normalColor = UIColor.hexString(colorString: "B9BDC4")
        tabbarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:selectColor], for: .selected)
        tabbarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:normalColor], for: .normal)
        tabbarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        nav.tabBarItem = tabbarItem
        return nav
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
