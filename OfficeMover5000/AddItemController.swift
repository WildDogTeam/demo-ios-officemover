//
//  AddItemController.swift
//  OfficeMover500
//
//  Created by Garin on 11/2/15.
//  Copyright (c) 2015 Wilddog. All rights reserved.
//
import UIKit

class AddItemController: PopoverMenuController {
    
    override var numItems: Int { return Items.count }
    
    // Set the cell with an image and the text
    override func populateCell(cell: PopoverMenuItemCell, row: Int) {
        cell.textLabel?.text = Items[row].0
        cell.name = Items[row].1
        let imageName = Items[row].1
        cell.imageView?.image = UIImage(named: "\(imageName)_unselected.png")
    }
    
    // When selected, add an item using the delegate, and dismiss the popover
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let type = Items[indexPath.row].2
        delegate?.addNewItem?(type)
        dismissPopover(true)
    }
}