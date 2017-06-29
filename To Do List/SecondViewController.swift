//
//  SecondViewController.swift
//  To Do List
//
//  Created by Gagandeep Nagpal on 27/12/15.
//  Copyright © 2015 Gagandeep Nagpal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject)
    {
        
        if item.text == ""
        {
            
        }
        else
        {
            
            self.view.endEditing(true)
            ToDoList.append(item.text!)
            item.text = ""
            NSUserDefaults.standardUserDefaults().setObject(ToDoList,forKey:"ToDoList")
            
        }
        

    }
   
   

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.item.delegate = self

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    // TO CONTROL KEYBOARD
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        
        item.resignFirstResponder()
        return true
    }
    

}