//
//  NewProductViewController.swift
//  My Wishlist
//
//  Created by Bruce Burgess on 2/23/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import CoreData

class NewProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Connecting the storyboard to code
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var storeTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Reconginzed when the image is tapped
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: "imageTapped")
        self.imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    func imageTapped() {
        //Setting up and getting the camera and using it
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
    }
    
    //Function use to select the picture from the camera
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //When the save button is tapped
    @IBAction func saveTapped(sender: AnyObject) {
        
        //Setting up and saving to core data
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        
        product.title = titleTextField.text
        product.store = storeTextField.text
        product.image = UIImagePNGRepresentation(self.imageView!.image!)
        
        do{
            try context.save()
        } catch _ {
            
        }

        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //When the cancel button is tapped
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
