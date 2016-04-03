//
//  SecondViewController.swift
//  Lost and Found
//
//  Created by alden lamp on 4/2/16.
//  Copyright © 2016 JasonAldenVincent. All rights reserved.
//
import UIKit
import Firebase

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    var imageData: NSData?
    @IBOutlet weak var usersName: UITextField!
    @IBOutlet weak var dateLost: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var usersImage: UIImageView!
    @IBOutlet weak var usersDescription: UITextView!
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("printed")
        self.dismissViewControllerAnimated(true, completion: nil)
        usersImage.image = image
        imageData = UIImagePNGRepresentation(usersImage.image!)
    }
    
    @IBAction func importImage(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    @IBAction func post(sender: AnyObject) {
        
        var whileLoopNumber = 0
        
        while whileLoopNumber <= whileLoopNumber + 5 {
        
            whileLoopNumber++
            
        var keyName = "name\(whileLoopNumber)"
        var keyDate = "dateLost\(whileLoopNumber)"
        var keyNumber = "phoneNumber\(whileLoopNumber)"
        var keyDescription = "description\(whileLoopNumber)"
        var keyImage = "image\(whileLoopNumber)"
        
        
        
        
        
        let base64String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        
        var userToBeAdded = [keyName:  usersName.text, keyDescription: usersDescription.text, keyDate: dateLost.text, keyNumber: phoneNumber.text, keyImage: base64String]
        
        var usersRef = ref.childByAppendingPath("users")
        
        var users = ["value": userToBeAdded]
        usersRef.setValue(users)
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

