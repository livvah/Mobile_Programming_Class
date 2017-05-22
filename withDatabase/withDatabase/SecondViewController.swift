//
//  SecondViewController.swift
//  withDatabase
//
//  Created by Olivia Vahsen on 4/19/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var txtUser: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!

    @IBOutlet weak var lblFeedback: UILabel!
    
    
    @IBAction func btnSignIn(_ sender: Any) {
        if(txtUser.text == "" || txtPass.text == "")
        {
            lblFeedback.text = "*fields cannot be blank"
            return
        }
        
        let myUrl = URL(string:"https://ovahsen.create.stedwards.edu/mobilephp/selectUser.php")
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "POST"
        
        let postString = "a=\(txtUser.text!)";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            do{
                
                let myJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                
                if let parsed_data = myJSON{
                    DispatchQueue.main.async(){
                        
                        if parsed_data.count == 0{
                            
                            let alertController = UIAlertController(title: "Access Denied:", message: "Username does not exist", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            self.lblFeedback.text = "Unsuccessful log in"
                            self.txtUser.text = ""
                            self.txtPass.text = ""
                            return
                        }
                        
                        let userPass = parsed_data[0] as? NSDictionary
                        
                        if(self.txtPass.text == userPass!["password"]! as? String){
                            
                            self.lblFeedback.text = "Successful Log in"
                            
                            let alertController = UIAlertController(title: "Welcome", message: "Successfully Logged in", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            self.txtUser.text = ""
                            self.txtPass.text = ""
                        }
                        else{
                            
                            let alertController = UIAlertController(title: "Access Denied", message: "Incorrect Password", preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            self.txtUser.text = "Unsuccessful log in"
                            self.txtPass.text = ""
                            
                        }//end else
                    }//end DispatchQueue
                
                }//end if let parsed_data = myJSON
                
                
            }//end do
            
            catch{
                print(error)
            }
            
        }//end task
        
        task.resume()
        
    }//end function

}

