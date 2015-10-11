//
//  LKUserDefaultOptionSwitch.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//
import UIKit

public class LKUserDefaultOptionSwitchCell: LKUserDefaultOptionCell {
    
    var sw:UISwitch!
    
    public override func didLoadOption(model:LKUserDefaultOptionModel) {
        if let value = model.value() as? Bool {
            sw.on = value
        }
    }

    public override func awakeFromNib() {
        setupUI()
        selectionStyle = .None
        super.awakeFromNib()
    }
    
    // MARK: - Local
    func setupUI() {
        let rect = CGRectMake(100, 0, 200, 50)
        sw = UISwitch(frame: rect)
        sw.addTarget(self, action: "valueChanged:", forControlEvents: .ValueChanged)
        
        contentView.addSubview(sw)
        sw.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["sw":sw]
        let hc0 = NSLayoutConstraint.constraintsWithVisualFormat("H:[sw(\(sw.frame.size.width))]-16-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(hc0)
        let vc0 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-6-[sw(\(sw.frame.size.width))]",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(vc0)
    }
    
    func valueChanged(sw: UISwitch) {
        if let model = model() {
            model.setValue(sw.on)
            model.save()
        }
    }
    
}