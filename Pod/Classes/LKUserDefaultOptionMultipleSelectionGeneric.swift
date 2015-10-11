//
//  LKUserDefaultOptionMultipleSelectionGeneric.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public class LKUserDefaultOptionMultipleSelectionGeneric: LKUserDefaultOption, LKUserDefaultOptionMultipleSelection {
    
    // MARK: - Local
    public var items:[LKUserDefaultOptionModelItem] = []
    
    func setupSelectedItems(ids:[String]) {
        selectedIndexPathSet = []
        for id in ids {
            for (index, item) in items.enumerate() {
                if id == item.itemId {
                    selectedIndexPathSet.insert(NSIndexPath(forRow: index, inSection: 0))
                    break
                }
            }
        }
    }
    
    // MARK: - LKUserDefaultOptionModel
    override public func valueLabel() -> String {
        return selectedIndexPathSet.map {
            return label($0)
            }.sort().joinWithSeparator(labelSeparator())
    }

    override public func setDefaultValue(value: AnyObject) {
        if let ids = value as? [String] {
            setupSelectedItems(ids)
        }
    }
    
    override public func save() {
        saveUserDefaults(selectedItems.map {return $0.itemId})
    }
    override public func restore() {
        if let ids = restoreUserDefaults() as? [String] {
            setupSelectedItems(ids)
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
    
    // MARK: - LKUserDefaultOptionMultipleSelection
    public var selectedIndexPathSet: Set<NSIndexPath> = []
    
    public func closeWhenSelected() -> Bool {
        return false
    }
    
    // MARK: - Helper
    var selectedItems: [LKUserDefaultOptionModelItem] {
        get {
            var selectedItems = [LKUserDefaultOptionModelItem]()
            for indexPath in selectedIndexPathSet {
                selectedItems.append(items[indexPath.row])
            }
            return selectedItems
        }
    }

}
