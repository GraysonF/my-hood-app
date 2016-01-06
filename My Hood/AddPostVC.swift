//
//  AddPostVC.swift
//  My Hood
//
//  Created by Grayson faircloth on 1/2/16.
//  Copyright © 2016 Grayson Faircloth. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        

    }

    
    @IBAction func makePostBtnPresed(sender: UIButton) {
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imagePath, title: title, description: desc)
                DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        
            
        }
        
    }
    
    
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addPicBtnPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
        
    }
    

}
