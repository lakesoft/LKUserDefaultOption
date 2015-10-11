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

    public func didLoadOption(option:LKUserDefaultOption) {
        detailTextLabel!.text = option.valueLabel()
        setNeedsDisplay()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()

        if let keyname = userDefaultOptionKeyName {
            if let option = LKUserDefaultOptionManager.getOption(keyname) {
                option.addHandler(didLoadOption)
                textLabel!.text = option.titleLabel()
            } else {
                print("did not create option for '\(keyname)'. call LKUserDefaultOptionManager.createOption")
            }
        } else {
            print("userDefaultModelKeyName is not set in ’User Defined Runtime Attributes’")
        }
    }
}
