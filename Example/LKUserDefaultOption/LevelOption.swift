//
//  Level.swift
//  LKUserDefaultOption
//
//  Created by Hiroshi Hashiguchi on 2015/09/24.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import LKUserDefaultOption

class LevelOption:LKUserDefaultOptionSingleSelectionGeneric {

    typealias ModelItem=LKUserDefaultOptionModelItemGeneric

    override func setupItem() {
        items = [
            ModelItem(itemId: "1", itemLabel: "Level1"),
            ModelItem(itemId: "2", itemLabel: "Level2"),
            ModelItem(itemId: "3", itemLabel: "Level3"),
            ModelItem(itemId: "4", itemLabel: "Level4"),
            ModelItem(itemId: "5", itemLabel: "Level5")
        ]
    }
    
    override func closeWhenSelected() -> Bool {
        return true
    }
}
