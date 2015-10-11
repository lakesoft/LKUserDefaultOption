//
//  LKUserDefaultOptionSingleSelectionGeneric.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public class LKUserDefaultOptionSingleSelectionGeneric:LKUserDefaultOption, LKUserDefaultOptionSingleSelection {
    
    // MARK: - Local
    public var items:[LKUserDefaultOptionModelItem] = []

    // MARK: - LKUserDefaultOptionModel
    override public func valueLabel() -> String {
        return label(selectedIndexPath)
    }
    
    override public func save() {
        let item = items[selectedIndexPath.row]
        saveUserDefaults(item.itemId)
    }
    
    override public func restore() {
        if let id = restoreUserDefaults() as? String {
            for (index, item) in items.enumerate() {
                if id == item.itemId {
                    selectedIndexPath = NSIndexPath(forRow: index, inSection: 0)
                    break
                }
            }
        }
    }
    
    // MARK: - LKUserDefaultOptionSelection
    public func label(indexPath:NSIndexPath) -> String {
        let item = items[indexPath.row]
        return item.itemLabel
    }
    
    public func numberOfRows(section:Int) -> Int {
        return items.count
    }
    
    // MARK: - LKUserDefaultOptionSingleSelection
    public var selectedIndexPath: NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    public func closeWhenSelected() -> Bool {
        return false
    }
}
