//
//  UserDefaults.swift
//  LKUserDefaultOption
//
//  Created by Hiroshi Hashiguchi on 2015/09/24.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import LKUserDefaultOption

class UserDefaults {
    
    static let sharedUserDefaults:UserDefaults = UserDefaults()
    
    let levelOption:LevelOption = LKUserDefaultOptionManager.createOption(
        "LevelOption", defaultValue:1)
    
    let tagOption:TagOption = LKUserDefaultOptionManager.createOption(
        "TagOption", defaultValue:["T001", "T002"])
    
    let lightOption:LightOption = LKUserDefaultOptionManager.createOption(
        "LightOption", defaultValue:true)
    
    let timeOption:TimeOption = LKUserDefaultOptionManager.createOption(
        "TimeOption", defaultValue:5)

}