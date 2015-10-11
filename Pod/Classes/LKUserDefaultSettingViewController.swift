//
//  LKUserDefaultSettingViewController.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/20.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

import UIKit

public class LKUserDefaultSettingViewController: UITableViewController {

    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        
        // NOTE: swift 2.0
        // NG) option as? <LKUserDefaultOptionSingleSelection, LKUserDefaultOptionLabel ...test protocol>
        
        if let cell = selectedCell as? LKUserDefaultOptionSingleSelectionCell {
            let viewController = LKUserDefaultOptionSingleSelectionViewController()
            let option = LKUserDefaultOptionManager.getOption(cell.userDefaultOptionKeyName)
            if let model = option as? LKUserDefaultOptionModel, selection = option as? LKUserDefaultOptionSingleSelection {
                viewController.model = model
                viewController.selection = selection
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else if let cell = selectedCell as? LKUserDefaultOptionMultipleSelectionCell {
            let viewController = LKUserDefaultOptionMultipleSelectionViewController()
            let option = LKUserDefaultOptionManager.getOption(cell.userDefaultOptionKeyName)
            if let model = option as? LKUserDefaultOptionModel, selection = option as? LKUserDefaultOptionMultipleSelection {
                viewController.model = model
                viewController.selection = selection
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        
    }
}
