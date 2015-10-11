//
//  LKUserDefaultOptionStepperCell.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//

import UIKit

public class LKUserDefaultOptionStepperCell: LKUserDefaultOptionCell {
    
    var stepper:UIStepper!
    var label:UILabel!
    
    public override func didLoadOption(model:LKUserDefaultOptionModel) {
        if let value = model.value() as? Double {
            stepper.value = value
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
        stepper = UIStepper(frame: rect)
        stepper.addTarget(self, action: "valueChanged:", forControlEvents: .ValueChanged)
        
        if let stepperModel = model() as? LKUserDefaultOptionStepper {
            stepper.minimumValue = stepperModel.minimumValue
            stepper.maximumValue = stepperModel.maximumValue
            stepper.stepValue = stepperModel.stepValue
        }

        
        contentView.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["stepper":stepper]
        let hc0 = NSLayoutConstraint.constraintsWithVisualFormat("H:[stepper(\(stepper.frame.size.width))]-16-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(hc0)
        let vc0 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[stepper(\(stepper.frame.size.width))]",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        contentView.addConstraints(vc0)
    }
    
    func valueChanged(stepper: UIStepper) {
        if let model = model() {
            model.setValue(stepper.value)
            model.save()
            print("stepperValue: \(model.value())")
        }
    }
    
}