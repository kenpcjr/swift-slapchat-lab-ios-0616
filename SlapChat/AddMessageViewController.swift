//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Kenneth Cooke on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    
    let dataStore = DataStore.sharedDataStore

    @IBOutlet weak var addTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        
        let newMessage = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: dataStore.managedObjectContext) as! Message
        
        newMessage.content = addTextField.text
        newMessage.createdAt = "07/20/2016"
        
        dataStore.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
