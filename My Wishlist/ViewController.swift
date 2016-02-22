//
//  ViewController.swift
//  My Wishlist
//
//  Created by Bruce Burgess on 2/22/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //Connect the tableView with the storybard
    @IBOutlet weak var tableView: UITableView!
    
    //Setting up the core data array for the products
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set the delegate and datasource to this view controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        makeSampleProduct()
        
        //Sets teh context and calls the manageObjectContexts from the AppDelegate
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        //Requests the items from data
        let request = NSFetchRequest(entityName: "Product")
        
        //Make a place for the results to be stored
        var results : [AnyObject]?
        
        do{
            //attempt to get dtat from the request
            results = try context.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        //If there are results put them in the table
        if results != nil{
            self.products = results! as! [Product]
        }

    }
    
    //Makes a sample product to test
    func makeSampleProduct() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = "Adias Shoes"
        
        do{
            try context.save()
        } catch _ {
            
        }
    }
    
    //Set the rows of the table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    //Set up the cells for the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        
        return cell
    }


}

