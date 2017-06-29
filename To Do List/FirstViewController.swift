//
//  FirstViewController.swift
//  To Do List
//
//  Created by Gagandeep Nagpal on 27/12/15.
//  Copyright © 2015 Gagandeep Nagpal. All rights reserved.
//

import UIKit

var ToDoList = [String]()


class FirstViewController: UIViewController,UITableViewDelegate
{

    
    @IBOutlet var ToDoListTable: UITableView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
                    if NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") != nil
                    {
                        ToDoList = NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") as! [String]
                        
            }
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return ToDoList.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        cell.textLabel?.text = String(indexPath.row + 1) + ".  " + ToDoList[indexPath.row]
        
        return cell
        
    }
    
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            ToDoList.removeAtIndex(indexPath.row)
            
            //TO STORE DATA
            NSUserDefaults.standardUserDefaults().setObject(ToDoList, forKey: "ToDoList")
            
            ToDoListTable.reloadData()
        }
        
        
    }
    


    
    override func viewDidDisappear(animated: Bool)
    {
        ToDoListTable.reloadData()
    }


}



