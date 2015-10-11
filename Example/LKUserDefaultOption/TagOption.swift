//
//  TagOption.swift
//  LKUserDefaultOption
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import LKUserDefaultOption

class Tag {
    let id: String
    let label:String
    init(id:String, label:String) {
        self.id = id
        self.label = label
    }
}

class TagOption:LKUserDefaultOption, LKUserDefaultOptionMultipleSelection {

    // MARK: - Local
    var tags:[Tag] = [Tag]()
    func setupTags() {
        tags = [
            Tag(id: "T001", label: "Animal"),
            Tag(id: "T002", label: "Fruit"),
            Tag(id: "T003", label: "Science"),
            Tag(id: "T004", label: "Nature"),
            Tag(id: "T005", label: "Life")
        ]
    }
    
    // MARK: - LKUserDefaultOption
    internal required init(keyname:String) {
        super.init(keyname: keyname)
        
        setupTags()
        
        if let ids = restoreUserDefaults() as? [String] {
            for id in ids {
                for (index, tag) in tags.enumerate() {
                    if id == tag.id {
                        selectedIndexPathSet.insert(NSIndexPath(forRow: index, inSection: 0))
                        break
                    }
                }
            }
        }
    }
    
    // MARK: - LKUserDefaultOption
    override func valueLabel() -> String {
        // TODO: use map
        var labels = [String]()
        for indexPath in selectedIndexPathSet {
            labels += [label(indexPath)]
        }
        return labels.sort().joinWithSeparator(labelSeparator())
    }
    
    override func save() {
        var ids = [String]()
        for tag in selectedTags {
            ids.append(tag.id)
        }
        saveUserDefaults(ids)
    }

    // MARK: - LKUserDefaultOptionSelection
    func label(indexPath:NSIndexPath) -> String {
        let tag = tags[indexPath.row]
        return tag.label
    }
    
    func model(indexPath:NSIndexPath) -> AnyObject {
        return tags[indexPath.row]
    }
    
    func numberOfRows(section:Int) -> Int {
        return tags.count
    }

    func closeWhenSelected() -> Bool {
        return true
    }
    
    // MARK: - LKUserDefaultOptionMultipleSelection
    var selectedIndexPathSet: Set<NSIndexPath> = []
    
    func selectedModels() -> [AnyObject] {
        return selectedTags
    }
    
    
    // MARK: - Helper
    var selectedTags: [Tag] {
        get {
            var selectedTags = [Tag]()
            for indexPath in selectedIndexPathSet {
                selectedTags.append(tags[indexPath.row])
            }
            return selectedTags
        }
    }
    
}
