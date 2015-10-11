//
//  LKUserDefaultModelSelection.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/18.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

public protocol LKUserDefaultOptionSingleSelection:LKUserDefaultOptionSelection {

    var selectedIndexPath: NSIndexPath { get set }
}

public extension LKUserDefaultOptionSingleSelection {

    // MARK: - LKUserDefaultOptionSelection
    func isSelected(indexPath:NSIndexPath) -> Bool {
        return selectedIndexPath == indexPath
    }
}