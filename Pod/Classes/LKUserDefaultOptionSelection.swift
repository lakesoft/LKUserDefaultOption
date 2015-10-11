//
//  LKUserDefaultOptionSelection.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public protocol LKUserDefaultOptionSelection {
    
    func label(indexPath:NSIndexPath) -> String
    func sectionLabel(section:Int) -> String
    
    func numberOfRows(section:Int) -> Int
    func numberOfSections() -> Int
    
    func isSelected(indexPath:NSIndexPath) -> Bool
    func closeWhenSelected() -> Bool

}

public extension LKUserDefaultOptionSelection {
    
    func sectionLabel(section:Int) -> String {
        return ""
    }
    
    func numberOfSections() -> Int {
        return 1
    }

}
