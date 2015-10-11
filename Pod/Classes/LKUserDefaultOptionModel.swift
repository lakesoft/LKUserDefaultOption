//
//  LKUserDefaultOptionModel.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//
// model has [item]

public protocol LKUserDefaultOptionModel {
    
    func setupItem()                // optional(Selection Type) call at first after init
    
    func titleLabel() -> String
    func valueLabel() -> String
    
    func setValue(value:AnyObject)  // optional(Value Type)
    func value() -> AnyObject?      // optional(Value Type)
    
    func save()
    func restore()
    
    func setDefaultValue(value:AnyObject)
}

