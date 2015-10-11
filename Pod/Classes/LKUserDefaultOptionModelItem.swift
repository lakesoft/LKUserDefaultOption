//
//  LKUserDefaultOption, LKUserDefaultOptionModelItem.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public protocol LKUserDefaultOptionModelItem:AnyObject {
    var itemId: String { get }
    var itemLabel: String { get }
}

public class LKUserDefaultOptionModelItemGeneric:LKUserDefaultOptionModelItem {
    public var itemId:String
    public var itemLabel:String
    
    public init(itemId:String, itemLabel:String) {
        self.itemId = itemId
        self.itemLabel = itemLabel
    }
}
