//
//  LKUserDefaultOptionCell.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/19.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

import UIKit

public class LKUserDefaultOptionCell: UITableViewCell {

    public var userDefaultOptionKeyName: String!

    public func didLoadOption(model:LKUserDefaultOptionModel) {
        if let label = detailTextLabel {
            label.text = model.valueLabel()
        }
        setNeedsDisplay()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if let option = option() {
            option.addHandler(didLoadOption)
            textLabel!.text = option.titleLabel()
        }
    }
    
    public func option() -> LKUserDefaultOption? {
        if let keyname = userDefaultOptionKeyName {
            if let option = LKUserDefaultOptionManager.getOption(keyname) {
                return option
            } else {
                print("did not create option for '\(keyname)'. call LKUserDefaultOptionManager.createOption")
            }
        } else {
            print("userDefaultModelKeyName is not set in ’User Defined Runtime Attributes’")
        }
        return nil
    }
        
    public func model() -> LKUserDefaultOptionModel? {
        if let model = option() as? LKUserDefaultOptionModel {
            return model
        }
        return nil
    }
}
