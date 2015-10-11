//
//  LKUserDefaultOptionX.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

public class LKUserDefaultOptionStepper:LKUserDefaultOption {
    
    public var optionValue:Double = 0
    public var minimumValue: Double = 0
    public var maximumValue: Double = 10.0
    public var stepValue: Double = 1.0
    
    // MARK: - LKUserDefaultOptionModel
    public override func save() {
        saveUserDefaults(optionValue)
    }
    public override func restore() {
        if let value = restoreUserDefaults() as? Double {
            optionValue = value
        }
    }
    public override func setValue(value:AnyObject) {
        if let value = value as? Double {
            optionValue = value
        }
    }
    
    public override func value() -> AnyObject? {
        return optionValue
    }
    
    public override func setDefaultValue(defaultValue: AnyObject) {
        if let defaultValue = defaultValue as? Double {
            optionValue = defaultValue
        }
    }
}
