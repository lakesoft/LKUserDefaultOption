//
//  Level.swift
//  LKUserDefaultOption
//
//  Created by Hiroshi Hashiguchi on 2015/09/24.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import LKUserDefaultOption

class LevelOption:LKUserDefaultOption, LKUserDefaultOptionSingleSelection {
    
    // MARK: - Local
    var levels:[Int] = [1, 2, 3, 4, 5]
    
    // MARK: - LKUserDefaultOption
    internal required init(keyname:String) {
        selectedIndexPath = NSIndexPath(forRow: 0, inSection: 0)

        super.init(keyname: keyname)

        if let value = restoreUserDefaults() as? Int {
            for (index, level) in levels.enumerate() {
                if value == level {
                    selectedIndexPath = NSIndexPath(forRow: index, inSection: 0)
                    break
                }
            }
        }
    }
    
    // MARK: - LKUserDefaultOption
    override func valueLabel() -> String {
        return label(selectedIndexPath)
    }

    // MARK: - LKUserDefaultOptionSelection
    func label(indexPath:NSIndexPath) -> String {
        let level = levels[indexPath.row]
        return "Level \(level)"
    }
    
    func model(indexPath:NSIndexPath) -> AnyObject {
        return levels[indexPath.row]
    }
    
    func numberOfRows(section:Int) -> Int {
        return levels.count
    }
    
    override func save() {
        let level = levels[selectedIndexPath.row]
        saveUserDefaults(level)
    }
    
    // MARK: - LKUserDefaultOptionSingleSelection
    var selectedIndexPath: NSIndexPath
    
    func closeWhenSelected() -> Bool {
        return true
    }
    

}
