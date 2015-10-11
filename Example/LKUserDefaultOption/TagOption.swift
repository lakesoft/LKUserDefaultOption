//
//  TagOption.swift
//  LKUserDefaultOption
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import LKUserDefaultOption

class TagOption:LKUserDefaultOptionMultipleSelectionGeneric {

    typealias ModelItem=LKUserDefaultOptionModelItemGeneric
    
    override func setupItem() {
        items = [
            ModelItem(itemId: "T001", itemLabel: "Animal"),
            ModelItem(itemId: "T002", itemLabel: "Fruit"),
            ModelItem(itemId: "T003", itemLabel: "Science"),
            ModelItem(itemId: "T004", itemLabel: "Nature"),
            ModelItem(itemId: "T005", itemLabel: "Life")
        ]
    }
    
    override func closeWhenSelected() -> Bool {
        return true
    }
}
