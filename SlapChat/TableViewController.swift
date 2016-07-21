//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    let dataStore = DataStore.sharedDataStore
    
    var messagesArray: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        dataStore.fetchData()
        
        
        
        messagesArray = dataStore.messages
        
        if messagesArray.count == 0 {
            
            dataStore.generateTestData()
            
            messagesArray = dataStore.messages
        }
        
        print(messagesArray.count)
        
        for message in messagesArray {
            
            print(message.content)
            
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        dataStore.fetchData()
        
        messagesArray = dataStore.messages
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messagesArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       let cell = self.tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
    
        cell.textLabel?.text = messagesArray[indexPath.row].content
        
        return cell
    
    }
    
    @IBAction func sortTapped(sender: AnyObject) {
        
        self.fetchData()
        
        messagesArray = dataStore.messages
        
        self.tableView.reloadData()
        
        
        
    }
    
    
    
    func fetchData ()
    {
        //perform a fetch request to fill an array property on your datastore
        
        let sortByDate = NSSortDescriptor.init(key: "createdAt", ascending: false)
        
        let fetchRequest = NSFetchRequest.init(entityName: "Message")
        
        fetchRequest.sortDescriptors = [sortByDate]
        
        do {
            
            try dataStore.messages = dataStore.managedObjectContext.executeFetchRequest(fetchRequest) as! [Message]
            
        } catch {
            
            print("Fetch Error")
        }
        
        
        
            }
}
