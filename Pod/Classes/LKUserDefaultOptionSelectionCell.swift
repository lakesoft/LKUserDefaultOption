//
//  LKUserDefaultOptionSelectionCell.swift
//  Pods
//
//  Created by Hiroshi Hashiguchi on 2015/10/11.
//
//
import UIKit

public class LKUserDefaultOptionSelectionCell: LKUserDefaultOptionCell {
    public override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .DisclosureIndicator
    }
}
