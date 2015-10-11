//
//  LKUserDefaultOptionGeneric.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/09/24.
//
//

public class LKUserDefaultOption {
    
    public var keyname:String
    public var handlers: [(LKUserDefaultOption->Void)]

    public required init(keyname:String) {
        self.keyname = keyname
        self.handlers = []
        
    }

    public func notifyUpdate() {
        for handler in handlers {
            handler(self)
        }
    }
    
    public func addHandler(handler: LKUserDefaultOption->Void) {
        handlers += [handler]
        handler(self)
    }
    
    public func save() {
        // do nothing
    }

    public func restore() {
        // do nothing
    }

    public func saveUserDefaults(value:AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: keyname)
        NSUserDefaults.standardUserDefaults().synchronize()
        notifyUpdate()
    }
    
    public func restoreUserDefaults() -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().objectForKey(keyname)
    }
    
    // MARK: - LKUserDefaultOptionLabel
    public func titleLabel() -> String {
        return NSLocalizedString(keyname, comment: "")
    }
    
    public func valueLabel() -> String {
        return ""
    }

}
