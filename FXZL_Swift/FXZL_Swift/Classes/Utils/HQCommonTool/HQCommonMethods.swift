//
//  HQCommonMethods.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/1.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCommonMethods {
    //
}

// MARK: - 本地读写操作
extension HQCommonMethods {
    class func saveValue(_ key: String, _ value : Any?) -> Void {
        if value == nil {
            return
        }
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func valueForkey(_ key: String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    class func removeValue(_ key: String) -> Void {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

// MARK: - 获取当前控制器
extension HQCommonMethods {
    class func currentVC() -> UIViewController? {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.shared.windows
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindowLevelNormal {
                    window = tmpWin
                    break
                }
            }
        }
        let resultVC = window?.rootViewController
        return topVC(resultVC)
    }
    
    class func topVC(_ vc: UIViewController?) -> UIViewController? {
        if vc == nil {
            return nil;
        }
        if let presentVC = vc?.presentedViewController {
            return topVC(presentVC)
        }else if let tabVC = vc as? UITabBarController {
            if let selectVC = tabVC.selectedViewController {
                return topVC(selectVC)
            }
            return nil
        }else if let navVC = vc as? UINavigationController {
            return topVC(navVC.visibleViewController)
        }else {
            return vc
        }
    }
}

// MARK: - 系统弹框
extension HQCommonMethods {
    @discardableResult class func showSheetView(title: String?, message: String?, cancelButtonTitle: String?, buttontitles:[String]?,cancelBlock: @escaping ()->(), sureBlock: @escaping (_ action: UIAlertAction)->()) -> UIAlertController {
        let viewController = HQCommonMethods.currentVC()
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for buttonTitle in buttontitles ?? [] {
            let sureAction = UIAlertAction(title: buttonTitle, style: .default) { (action) in
                sureBlock(action)
            }
            sureAction.setValue(UIColor.hexString(colorString: "0f0f0f"), forKey: "titleTextColor")
            alertVC.addAction(sureAction)
        }
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .default) { (action) in
                cancelBlock()
            }
            cancelAction.setValue(UIColor.hexString(colorString: "0f0f0f"), forKey: "titleTextColor")
            alertVC.addAction(cancelAction)
        }
        if let title = title {
            let titleAttributed = NSMutableAttributedString(string: title)
            titleAttributed.addAttribute(NSAttributedStringKey.font, value: PingFangSCBold(18), range: NSRange.init(location: 0, length: title.count))
            titleAttributed.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.hexString(colorString: "0F0F0F"), range: NSRange.init(location: 0, length: title.count))
            alertVC.setValue(titleAttributed, forKey: "attributedTitle")
        }
        if let message = message {
            let messageAttributed = NSMutableAttributedString(string: message)
            messageAttributed.addAttribute(NSAttributedStringKey.font, value: PingFangSCBold(18), range: NSRange.init(location: 0, length: message.count))
            messageAttributed.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.hexString(colorString: "0F0F0F"), range: NSRange.init(location: 0, length: message.count))
            alertVC.setValue(messageAttributed, forKey: "attributedMessage")
        }
        let deviceType = UIDevice.current.model
        if deviceType == "iPad" {
            alertVC.popoverPresentationController?.sourceView = viewController?.view
        }
        viewController?.present(alertVC, animated: true, completion: nil)
        return alertVC
    }
    
    @discardableResult class func showAlertView(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?, cancelBlock: @escaping ()->(), sureBlock: @escaping ()->()) -> UIAlertController {
        let viewController = HQCommonMethods.currentVC()
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let cancelButtonTitle = cancelButtonTitle {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { (action) in
                cancelBlock()
            }
            alertVC.addAction(cancelAction)
        }
        if let sureButtonTitle = sureButtonTitle {
            let sureAction = UIAlertAction(title: sureButtonTitle, style: .default) { (action) in
                sureBlock()
            }
            alertVC.addAction(sureAction)
        }
        let deviceType = UIDevice.current.model
        if deviceType == "iPad" {
            alertVC.popoverPresentationController?.sourceView = viewController?.view
        }
        viewController?.present(alertVC, animated: true, completion: nil)
        return alertVC
    }
}

// MARK: - 拨打电话
extension HQCommonMethods {
    class func callPhone(_ phone:String?) -> Void {
        if let phone = phone {
            let callPhone = "telprompt://" + phone
            UIApplication.shared.openURL(URL(string: callPhone)!)
        }
    }
}
