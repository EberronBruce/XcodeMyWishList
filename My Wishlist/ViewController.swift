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
    
    //Keep track of row the user selects
    var selectedProduct : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set the delegate and datasource to this view controller
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //makeSampleProduct()
        
    }
    
    override func viewWillAppear(animated: Bool) {
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
        
        //Update table view
        self.tableView.reloadData()

    }
    
    //Makes a sample product to test
    func makeSampleProduct() {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = "Dicky Shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "nike.jpeg")!, 1)
        
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
        cell.imageView!.image = UIImage(data: product.image!)
        
        return cell
    }
    
    //Get the row selected and transistion to next view controller
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Set the selected product
        self.selectedProduct = self.products[indexPath.row]
        //Transition to next view controller
        self.performSegueWithIdentifier("detailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detailSegue"{
            let detailVC = segue.destinationViewController as! ProductDetailViewController
            //set the product to selected product from the table view
            detailVC.product = self.selectedProduct
        }
    }


}

