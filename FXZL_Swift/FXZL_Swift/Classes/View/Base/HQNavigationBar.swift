//
//  HQNavigationBar.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQNavigationBar: HQBaseView {

    lazy var contentView : UIView = {
        let contentView = UIView.init(frame: RECT(0, self.getHeight() - 44, kScreenW, 44))
        contentView.backgroundColor = UIColor.clear
        self.addSubview(contentView)
        return contentView
    }()
    lazy var leftButton : UIButton? = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        button.frame = RECT(0, 0, 32, 44)
        contentView.addSubview(button)
        return button
    }()
    lazy var rightButton: UIButton? = {
        let button = UIButton.init(type: .custom)
        button.setTitleColor(UIColor.hexString(colorString: "2B3343"), for: .normal)
        button.titleLabel?.font = PingFangSCRegular(15)
        self.contentView.addSubview(button)
        return button
    }()
    lazy var lineView: UIView? = {
        let lineView = UIView.init(frame: RECT(0, contentView.getHeight() - kLineH, kScreenW, kLineH))
        lineView.backgroundColor = UIColor.hexString(colorString: "E1E1E1")
        self.contentView.addSubview(lineView)
        return lineView
    }()
    lazy var titleLabel: UILabel? = {
        let titleLabel = UILabel.init(frame: RECT(0, 0, kScreenW - 60 * 2, 44))
        titleLabel.font = PingFangSCRegular(18)
        titleLabel.textColor = UIColor.hexString(colorString: "2B3343")
        titleLabel.textAlignment = .center
        titleLabel.center = POINT(kScreenW / 2.0, 22)
        self.contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    var titleView: UIView? {
        didSet{
            guard let titleView = titleView else {
                return
            }
            self.contentView.addSubview(titleView)
            var leftWidth: CGFloat = 0
            var centerX = kScreenW / 2.0
            if let leftButton = self.leftButton {
                leftWidth = leftButton.isHidden ? 0 : 32
            }
            if let rightButton = self.rightButton {
                centerX = (rightButton.isHidden ? (kScreenW - leftWidth) / 2.0 : (kScreenW - leftWidth - rightButton.getWidth()) / 2.0) + leftWidth
            }
            titleView.center = POINT(centerX, 22)
        }
    }
    
    var hiddenLeftButton = false {
        didSet {
            leftButton?.isHidden = hiddenLeftButton
        }
    }
    var title = "" {
        didSet {
            if title.count == 0 {
                return
            }
            titleLabel?.text = title
        }
    }
    
    var rightButtonTitle = "" {
        didSet {
            if rightButtonTitle.count == 0 {
                return
            }
            let width = rightButtonTitle.widthWithFont(PingFangSCRegular(15))
            self.rightButton?.setTitle(rightButtonTitle, for: .normal)
            self.rightButton?.frame = RECT(kScreenW - width - 10, 0, width, 44);
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        removeNavigationBarBottomLine(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HQNavigationBar {
    func removeNavigationBarBottomLine( _ hidden : Bool) -> Void {
        lineView?.isHidden = hidden
    }
}
