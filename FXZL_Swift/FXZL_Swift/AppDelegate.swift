//
//  AppDelegate.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/25.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = HQTabBarController()
        
        NotificationCenter.default.addObserver(self, selector: #selector(goLogin), name: NSNotification.Name(HQLoginNotificationName), object: nil)
        self.launchLogin()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension AppDelegate {
    //自动登录
    func launchLogin() -> Void {
        guard let phone = HQCommonMethods.valueForkey(kPhoneKey) as? String,
            let password = HQCommonMethods.valueForkey(kPasswordKey) as? String else {
                NotificationCenter.default.post(name: NSNotification.Name(HQLoginNotificationName), object: nil)
                return
        }
        let loginVM = HQLoginVM()
        loginVM.phone = phone
        loginVM.password = password
        loginVM.requestLoginAPi { (success) in
            if success {
                NotificationCenter.default.post(name: NSNotification.Name(HQLoginNotificationName), object: nil)
            }
        }
    }
    //强制登录
    @objc func goLogin() -> Void {
        if !HQCommonTool.isLogin() {
            window?.rootViewController?.present(HQNavigationController(rootViewController: HQLoginVC()), animated: true, completion: nil)
        }
    }
}
