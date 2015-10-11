
//
//  LKUserDefaultModelManager.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/18.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

public class LKUserDefaultOptionManager {

    static var options = [String:LKUserDefaultOption]()

    public class func createOption<T:LKUserDefaultOption>(keyname:String, defaultValue:AnyObject) -> T {
        let option:T = T(keyname:keyname)
        option.setupOption(defaultValue)
        options[keyname] = option
        return option
    }

    public class func getOption(keyname:String) -> LKUserDefaultOption? {
        if let option = options[keyname] {
            return option
        }
        return nil
    }

}
