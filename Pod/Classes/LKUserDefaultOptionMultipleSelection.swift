//
//  LKUserDefaultModelMultipleSelection.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/19.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

public protocol LKUserDefaultOptionMultipleSelection: LKUserDefaultOptionSelection {
    
    var selectedIndexPathSet: Set<NSIndexPath> { get set }
    func labelSeparator() -> String
}

public extension LKUserDefaultOptionMultipleSelection {
    
    func labelSeparator() -> String {
        return ","
    }
    
    // MARK: - LKUserDefaultOptionSelection
    func isSelected(indexPath:NSIndexPath) -> Bool {
        return selectedIndexPathSet.contains(indexPath)
    }

}

