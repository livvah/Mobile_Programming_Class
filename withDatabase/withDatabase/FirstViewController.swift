//
//  FirstViewController.swift
//  withDatabase
//
//  Created by Olivia Vahsen on 4/19/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var txtUsername: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtFullName: UITextField!
    
    
    
    @IBAction func btnSignUp(_ sender: Any) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://ovahsen.create.stedwards.edu/mobilephp/mobile1_inserts.php")! as URL)
        
        request.httpMethod = "POST"
        
        let postString = "a=\(txtUsername.text!)&b=\(txtPassword.text!)&c=\(txtFullName.text!)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            DispatchQueue.main.async(){
                
                //check if exists
                
                if (responseString! == "Success"){
                
                    let alertController = UIAlertController(title: "New Account", message: "Successfully Added", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }// end if for success
                else{
                    let alertController = UIAlertController(title: "Cannot Create New Account", message: "Username already exists", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }//end else
                
                self.txtUsername.text = ""
                self.txtPassword.text = ""
                self.txtFullName.text = ""
                
            }//end dispatch queue sync
        }//end of task
        task.resume()
        
    }//end btnSignup
    
    
}

