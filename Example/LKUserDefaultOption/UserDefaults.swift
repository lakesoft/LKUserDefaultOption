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
    
    let levelOption:LevelOption = LKUserDefaultOptionManager.createOption("LevelOption")
    let tagOption:TagOption = LKUserDefaultOptionManager.createOption("TagOption")
    
}