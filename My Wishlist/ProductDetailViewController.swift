//
//  ProductDetailViewController.swift
//  My Wishlist
//
//  Created by Bruce Burgess on 2/22/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    //Connect the labels and image view from the storyboard
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //Make a product object
    var product : Product? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titleLabel.text = self.product!.title
        self.storeLabel.text = "Nike Outlet"//self.product!.store
        self.imageView.image = UIImage(data: self.product!.image!)
    }

}
