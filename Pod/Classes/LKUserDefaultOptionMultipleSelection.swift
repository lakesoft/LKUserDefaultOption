//
//  LKUserDefaultModelMultipleSelection.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/19.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

public protocol LKUserDefaultOptionMultipleSelection: LKUserDefaultOptionSelection {
    
    var selectedIndexPathSet: Set<NSIndexPath> { get set }
    func selectedModels() -> [AnyObject]

    func labelSeparator() -> String
}

public extension LKUserDefaultOptionMultipleSelection {
    
    func selectedModels() -> AnyObject {
        var models = [AnyObject]()
        for indexPath in selectedIndexPathSet {
            models += [model(indexPath)]
        }
        return models
    }

    func labelSeparator() -> String {
        return ","
    }
    
    // MARK: - LKUserDefaultOptionSelection
    func isSelected(indexPath:NSIndexPath) -> Bool {
        return selectedIndexPathSet.contains(indexPath)
    }

}