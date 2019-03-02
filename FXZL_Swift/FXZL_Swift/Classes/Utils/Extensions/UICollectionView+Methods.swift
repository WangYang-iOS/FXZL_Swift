//
//  UICollectionView+Methods.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCellNib(_ nib: String) -> Void {
        self.register(UINib.init(nibName: nib, bundle: nil), forCellWithReuseIdentifier: nib)
    }
    func registerCellClass(_ className: String) -> Void {
        self.register(NSClassFromString(className), forCellWithReuseIdentifier: className)
    }
    func registerSectionHeaderNib(_ nib: String) -> Void {
        self.register(UINib.init(nibName: nib, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: nib)
    }
    func registerSectionHeaderClass(_ className: String) -> Void {
        self.register(NSClassFromString(className), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: className)
    }
    func registerSectionFooterNib(_ nib: String) -> Void {
        self.register(UINib.init(nibName: nib, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: nib)
    }
    func registerSectionFooterClass(_ className: String) -> Void {
        self.register(NSClassFromString(className), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: className)
    }
}
