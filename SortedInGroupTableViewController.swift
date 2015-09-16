//
//  SortedInGroupTableViewController.swift
//  TableViewSortedInGroup
//
//  Created by ogre on 15/9/16.
//  Copyright © 2015年 ogre. All rights reserved.
//

import UIKit

class SortedInGroupTableViewController: UITableViewController {

    var contextList = [String]()
    
    var _resortedList = [String:Array<String>]()
    var _unSortedList = Array<String>()
    var _keyList = Array<String>()
    
    func initSettings(newContent:[String])
    {
        self.setContent(newContent)
    }
    
    func setContent(newContent:[String])
    {
        self.contextList = newContent
        self.resortContentList()
        self.tableView.reloadData()
    }
    
    // resort the Content, and make them in queue
    func resortContentList()
    {
        
        for conText in contextList
        {
            let firstCharactor = String(conText[conText.characters.startIndex]).uppercaseString
            if _resortedList.keys.contains(firstCharactor)
            {
                _resortedList[firstCharactor]?.append(conText)
            }
            else
            {
                _resortedList.updateValue([conText], forKey: firstCharactor)
            }
            _unSortedList.append(conText)
            
        }
        
        for key in _resortedList.keys
        {
            _resortedList[key] = _resortedList[key]?.sort()
        }
        
        _keyList = _resortedList.keys.sort()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return _resortedList.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(_keyList[section])
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _resortedList[_keyList[section]]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let curSection = indexPath.section
        let curRow = indexPath.row
        let curString = _resortedList[_keyList[curSection]]?[curRow]
        let row = contextList[_unSortedList.indexOf(curString!)!]
        
        cell.textLabel!.text = row
        
        return cell
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
