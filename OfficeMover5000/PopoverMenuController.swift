//
//  PopoverMenuController.swift
//  OfficeMover500
//
//  Created by Garin on 11/2/15.
//  Copyright (c) 2015 Wilddog. All rights reserved.
//
import UIKit

@objc protocol PopoverMenuDelegate {
    func dismissPopover(animated: Bool)
    
    optional func addNewItem(type: String)
    
    func setBackgroundLocally(type: String)
    optional func setBackground(type: String)
}

class PopoverMenuController : UITableViewController {
    
    var delegate: PopoverMenuDelegate?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.clearColor() // iOS 8 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize.height = 70 * CGFloat(numItems)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numItems
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: PopoverMenuItemCell! = tableView.dequeueReusableCellWithIdentifier("menuItemCell") as? PopoverMenuItemCell
        if cell == nil {
            cell = PopoverMenuItemCell(style: .Default, reuseIdentifier: "menuItemCell")
        }
        
        // Definitely exists now
        populateCell(cell, row: indexPath.row)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    // Dismiss the popover
    func dismissPopover(animated: Bool) {
        delegate?.dismissPopover(animated) // iOS 7
        dismissViewControllerAnimated(animated, completion: nil) // iOS 8
    }
    
    // Override this in subclass
    var numItems: Int { return 0 }
    
    // Override this in subclass
    func populateCell(cell: PopoverMenuItemCell, row: Int) {}
}