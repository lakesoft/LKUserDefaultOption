//
//  LKUserDefaultOptionBool.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public class LKUserDefaultOptionSwitch:LKUserDefaultOption {
 
    public var optionValue:Bool = false
    
    // MARK: - LKUserDefaultOptionModel
    public override func save() {
        saveUserDefaults(optionValue)
    }
    public override func restore() {
        if let value = restoreUserDefaults() as? Bool {
            optionValue = value
        }
    }
    public override func setValue(value:AnyObject) {
        if let value = value as? Bool {
            optionValue = value
        }
    }
    
    public override func value() -> AnyObject? {
        return optionValue
    }
    
    public override func setDefaultValue(defaultValue: AnyObject) {
        if let defaultValue = defaultValue as? Bool {
            optionValue = defaultValue
        }
    }

}
