//
//  HQCompanyDetailVC.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/12.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCompanyDetailVC: HQBaseVC {
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var cid: Int? {
        didSet{
            companyVM.cid = cid
        }
    }
    var companyVM = HQCompanyDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hq_navigation.removeNavigationBarBottomLine(true)
        topSpace.constant = topSpaceConstant()
        AdjustmentBehavior(tableView)
        tableView.estimatedHeight()
        tableView.registerCellClass("UITableViewCell")
        requestCompanyDetail()
    }
}

extension HQCompanyDetailVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}

extension HQCompanyDetailVC {
    func requestCompanyDetail() {
        companyVM.requestCompanyDetail {[weak self] (success) in
            if success {
                self?.companyLogo.hq_setImage(image: self?.companyVM.logo, placeholder: kDefaultLogo)
                self?.companyLabel.text = self?.companyVM.name
                self?.tableView.reloadData()
            }
        }
    }
}
