//
//  NewProductViewController.swift
//  My Wishlist
//
//  Created by Bruce Burgess on 2/23/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //When the save button is tapped
    @IBAction func saveTapped(sender: AnyObject) {
        print("Save")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //When the cancel button is tapped
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
