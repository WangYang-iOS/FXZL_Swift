//
//  HQDemandVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/2/26.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQDemandVC: HQBaseVC {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    
    lazy var segment: HQSegment = {
        let segment = HQSegment.init(frame: RECT(0, 0, 205, 44), titles: ["找资源","找人脉"], delegate: self as HQSegmentDelegate)
        segment.font = PingFangSCBold(17)
        segment.normalColor = UIColor.hexString(colorString: "666C77")
        segment.selectColor = UIColor.hexString(colorString: "2B3343")
        return segment
    }()
    lazy var demandTableView: HQDemandTableView = {
        let demandTableView = HQDemandTableView.init(frame: scrollView.bounds, style: .plain)
        scrollView.addSubview(demandTableView)
        return demandTableView
    }()
    lazy var connectTableView: HQDemandTableView = {
        let demandTableView = HQDemandTableView.init(frame: RECT(kScreenW, 0, scrollView.getWidth(), scrollView.getHeight()), style: .plain)
        scrollView.addSubview(demandTableView)
        return demandTableView
    }()
    
    var demandVM = HQDemandVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hq_navigation.hiddenLeftButton = true
        self.hq_navigation.titleView = segment
        topSpace.constant = topSpaceConstant()
        scrollView.contentSize = SIZE(kScreenW * CGFloat(2), kScreenH)
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        demandVM.requestDemandData { [weak self] (success) in
            if success {
                self?.demandTableView.dataArray = self?.demandVM.dataArray
                self?.connectTableView.dataArray = self?.demandVM.dataArray
            }
        }
    }
}

extension HQDemandVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        segment.moveBottomView(contentOffset: scrollView.contentOffset)
    }
}

extension HQDemandVC: HQSegmentDelegate {
    func segment(_ segment: HQSegment, didSelectAt index: Int) {
        //
    }
}

extension HQDemandVC {
    func layoutScrollView() {
        
    }
    
}
