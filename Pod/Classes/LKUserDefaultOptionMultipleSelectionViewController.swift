//
//  LKUserDefaultModelMultipleSelectionViewController.swift
//  VideoEver
//
//  Created by Hiroshi Hashiguchi on 2015/07/19.
//  Copyright (c) 2015年 lakesoft. All rights reserved.
//

import UIKit

public class LKUserDefaultOptionMultipleSelectionViewController: UITableViewController {

    var option:LKUserDefaultOption!
    var selection:LKUserDefaultOptionMultipleSelection!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = option.titleLabel()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "LKUserDefaultModelMultipleSelectionViewControllerCell")
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selection.numberOfRows(section)
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LKUserDefaultModelMultipleSelectionViewControllerCell", forIndexPath: indexPath) 
        
        cell.textLabel!.text = selection.label(indexPath)
        cell.accessoryType = selection.isSelected(indexPath) ? .Checkmark : .None
        
        return cell
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if selection.isSelected(indexPath) {
            selection.selectedIndexPathSet.remove(indexPath)
        } else {
            selection.selectedIndexPathSet.insert(indexPath)
        }
        option.save()
        tableView.reloadRowsAtIndexPaths(Array(selection.selectedIndexPathSet), withRowAnimation: UITableViewRowAnimation.None)
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
        if selection.closeWhenSelected() {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
