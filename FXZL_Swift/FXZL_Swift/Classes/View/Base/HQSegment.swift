//
//  HQSegment.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/4.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

@objc protocol HQSegmentDelegate: NSObjectProtocol {
    @objc optional func segment(_ segment: HQSegment, didSelectAt index: Int)
}

class HQSegment: UIView {
    var delegate: HQSegmentDelegate?
    var font: UIFont? = PingFangSCRegular(14) {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    var normalColor: UIColor? = UIColor.red {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    var selectColor: UIColor? = UIColor.blue {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    var normalImage: String? {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    var selectImage: String? {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    var lineColor: UIColor? = UIColor.hexString(colorString: "1E6DFF") {
        didSet {
            bottomView?.backgroundColor = lineColor
        }
    }
    var selectedButton: UIButton = UIButton()
    var showBottomLine: Bool? = true {
        didSet {
            bottomView?.isHidden = !(showBottomLine ?? true)
        }
    }
    var bottomWidth: CGFloat? = 20
    var titles: [String]? {
        didSet {
            layoutSegment(titles: titles)
        }
    }
    
    lazy var lineView: UIView? = {
        let lineView = UIView.init(frame: RECT(0, self.getHeight() - kLineH, self.getWidth(), kLineH))
        lineView.backgroundColor = UIColor.hexString(colorString: "ebebeb")
        self.addSubview(lineView)
        return lineView
    }()
    
    lazy var bottomView: UIView? = {
        let bottomView = UIView.init(frame: RECT(0, self.getHeight() - 3 - kLineH, bottomWidth ?? 20, 3))
        bottomView.backgroundColor = lineColor
        bottomView.cornerWithRadius(bottomView.getHeight() / 2.0)
        self.addSubview(bottomView)
        return bottomView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HQSegment {
    convenience init(frame: CGRect, titles: [String]?, delegate: HQSegmentDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
        self.titles = titles
        layoutSegment(titles: titles)
        removeLineView()
    }
}

extension HQSegment {
    func layoutSegment(titles: [String]?) {
        guard let titles = titles else {
            return
        }
        let width = self.getWidth() / CGFloat(titles.count)
        let height = self.getHeight() - kLineH
        for i in 0..<titles.count {
            var button = self.viewWithTag(1000 + i) as? UIButton
            if button == nil {
                button = UIButton(type: .custom)
                button?.frame = RECT(width * CGFloat(i), 0, width, height)
                button?.tag = 1000 + i
                button?.setTitle(titles[i], for: .normal)
                button?.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
                self.addSubview(button!)
                if i == 0 {
                    button?.isSelected = true
                    selectedButton = button!
                    if showBottomLine == true {
                        bottomView?.center = POINT(button!.getCenterX(), (bottomView?.getCenterY())!)
                    }
                }
            }
            button?.titleLabel?.font = font
            button?.setTitleColor(normalColor, for: .normal)
            button?.setTitleColor(selectColor, for: .selected)
            if let normalImage = normalImage, normalImage.count > 0 {
                button?.setImage(UIImage(named: normalImage), for: .normal)
                button?.layoutButton(style: .right, space: 10)
            }
            if let selectImage = selectImage, selectImage.count > 0 {
                button?.setImage(UIImage(named: selectImage), for: .selected)
                button?.layoutButton(style: .right, space: 10)
            }
        }
    }
    
    @objc func clickButton(_ button: UIButton) -> Void {
        if button != self.selectedButton {
            button.isSelected = !button.isSelected;
            self.selectedButton.isSelected = !self.selectedButton.isSelected;
            self.selectedButton = button;
        }
        UIView.animate(withDuration: 0.25) {
            self.bottomView?.center = POINT(button.center.x, (self.bottomView?.center.y)!);
        }
        self.delegate?.segment?(self, didSelectAt: button.tag - 1000)
    }
}

extension HQSegment {
    func removeLineView(_ isHidden: Bool = false) {
        self.lineView?.isHidden = isHidden
    }
    func didSelectAtIndex(_ index: Int) {
        let button = self.viewWithTag(1000 + index) as! UIButton
        clickButton(button)
    }
    func moveBottomView(contentOffset: CGPoint) {
        guard let titles = titles else {
            return
        }
        let width = self.getWidth() / CGFloat(titles.count)
        
        if showBottomLine == true {
            bottomView?.center = POINT(width / 2.0 + contentOffset.x * (width / kScreenW), (bottomView?.center.y)!);
        }
        let index: Int = Int(floor((contentOffset.x + kScreenW / 2.0) / kScreenW))
        let button = self.viewWithTag(1000 + index) as! UIButton
        if button != self.selectedButton {
            button.isSelected = !button.isSelected;
            self.selectedButton.isSelected = !self.selectedButton.isSelected;
            self.selectedButton = button;
        }
    }
}
















