//
//  HQCircleCell.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

class HQCircleCell: UITableViewCell, HQProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray: [HQCircleModel]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerCellNib("HQCirclePartCell")
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HQCircleCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HQCirclePartCell", for: indexPath) as? HQCirclePartCell
        let circleModel = dataArray![indexPath.row]
        cell?.layoutCell(headerURL: circleModel.icon, name: circleModel.name, number: "\(circleModel.member_num ?? 0)" + "位老板")
        return cell!
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 15;
        let space: CGFloat = 12;
        let width: CGFloat = (kScreenW - padding - space * 2) / 2.5;
        let height: CGFloat = 185;
        return SIZE(width, height);
    }
    
}
