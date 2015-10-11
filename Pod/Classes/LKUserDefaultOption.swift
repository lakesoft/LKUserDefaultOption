//
//  LKUserDefaultOptionGeneric.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/09/24.
//
//

public class LKUserDefaultOption: LKUserDefaultOptionModel {
    
    public var keyname:String
    public var handlers: [(LKUserDefaultOptionModel->Void)]

    public required init(keyname:String) {
        self.keyname = keyname
        self.handlers = []
    }
    
    public func setupOption(defaultValue:AnyObject?) {
        setupItem()
        if NSUserDefaults.standardUserDefaults().objectForKey(keyname) == nil,
            let value = defaultValue {
                setDefaultValue(value)  // TODO: case missing value
        } else {
            restore()
        }
    }

    public func notifyUpdate() {
        for handler in handlers {
            handler(self)
        }
    }
    
    public func addHandler(handler: LKUserDefaultOptionModel->Void) {
        handlers += [handler]
        handler(self)
    }
    
    public func saveUserDefaults(value:AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: keyname)
        NSUserDefaults.standardUserDefaults().synchronize()
        notifyUpdate()
    }
    
    public func restoreUserDefaults() -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(keyname)
    }

    
    // MARK: - LKUserDefaultOptionModel
    public func setupItem() {
        // do nothing (optional)
    }
    
    public func titleLabel() -> String {
        return NSLocalizedString(keyname, comment: "")
    }

    public func valueLabel() -> String {
        if let object = restoreUserDefaults() {
            object.description
        }
        return ""
    }

        public func setDefaultValue(value: AnyObject) {
        // do nothing (optional)
    }
    public func setValue(value:AnyObject) {
        // do nothing
    }
    public func value() -> AnyObject? {
        // do nothing
        return nil
    }

    public func save() {
        // do nothing (optional)
    }
    public func restore() {
        // do nothing (optional)
    }

}
