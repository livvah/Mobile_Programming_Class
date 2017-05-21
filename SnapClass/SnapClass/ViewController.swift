//
//  ViewController.swift
//  SnapClass
//
//  Created by Olivia Vahsen on 3/22/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import UIKit

import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgPhoto: UIImageView!
    
    @IBAction func btnPicture(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            imagePicker.sourceType = .camera
            
            if UIImagePickerController.isCameraDeviceAvailable(.front){
                
                imagePicker.cameraDevice = .front
            }
            else{
                
                imagePicker.cameraDevice = .rear
            }
        }
        else {
            
            imagePicker.sourceType = .photoLibrary
        }
    
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable:Any]!) {
        
        imgPhoto.image = image
        self.dismiss(animated: true, completion: nil)
    }

   
    
    
    @IBAction func btnPost(_ sender: Any) {
        
        let social = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        social?.add(imgPhoto.image)
        
        self.present(social!, animated : true, completion: nil)
        
        
        
    }
}

