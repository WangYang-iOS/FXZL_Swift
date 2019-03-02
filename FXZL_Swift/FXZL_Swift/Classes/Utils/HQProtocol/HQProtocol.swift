//
//  HQProtocol.swift
//  FXZL_Swift
//
//  Created by yons on 2019/3/2.
//  Copyright © 2019年 yons. All rights reserved.
//

import UIKit

protocol HQProtocol {
    
}

extension HQProtocol where Self: UIView {
    static func loadNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}

extension HQProtocol where Self: UITableViewCell {
    static func registerCellNib(tableView: UITableView, _ nib: String? = nil) -> Void {
        tableView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forCellReuseIdentifier: nib ?? "\(self)")
    }
    static func registerCellClass(tableView: UITableView, _ className: String? = nil) -> Void {
        tableView.register(NSClassFromString(className ?? "\(self)"), forCellReuseIdentifier: className ?? "\(self)")
    }
    static func registerHeaderFooterNib(tableView: UITableView, _ nib: String? = nil) -> Void {
        tableView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forHeaderFooterViewReuseIdentifier: nib ?? "\(self)")
    }
    static func registerHeaderFooterClass(tableView: UITableView, _ className: String? = nil) -> Void {
        tableView.register(NSClassFromString(className ?? "\(self)"), forHeaderFooterViewReuseIdentifier: className ?? "\(self)")
    }
}

extension HQProtocol where Self: UICollectionViewCell {
    static func registerCellNib(collectionView: UICollectionView, _ nib: String? = nil) -> Void {
        collectionView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forCellWithReuseIdentifier: nib ?? "\(self)")
    }
    static func registerCellClass(collectionView: UICollectionView,_ className: String? = nil) -> Void {
        collectionView.register(NSClassFromString(className ?? "\(self)"), forCellWithReuseIdentifier: className ?? "\(self)")
    }
    static func registerSectionHeaderNib(collectionView: UICollectionView, _ nib: String? = nil) -> Void {
        collectionView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: nib ?? "\(self)")
    }
    static func registerSectionHeaderClass(collectionView: UICollectionView, _ className: String? = nil) -> Void {
        collectionView.register(NSClassFromString(className ?? "\(self)"), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: className ?? "\(self)")
    }
    static func registerSectionFooterNib(collectionView: UICollectionView, _ nib: String? = nil) -> Void {
        collectionView.register(UINib.init(nibName: nib ?? "\(self)", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: nib ?? "\(self)")
    }
    static func registerSectionFooterClass(collectionView: UICollectionView, _ className: String? = nil) -> Void {
        collectionView.register(NSClassFromString(className ?? "\(self)"), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: className ?? "\(self)")
    }
}
