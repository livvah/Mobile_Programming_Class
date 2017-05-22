//
//  ThirdViewController.swift
//  withDatabase
//
//  Created by Olivia Vahsen on 4/30/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var values:NSArray = []
    
   
    @IBOutlet weak var tblUsers: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        let mainData = values[indexPath.row] as? [String:Any]
        
        cell.textLabel?.text = mainData?["username"] as? String
        
        return cell
    }
    
    func getData()
    {
        let url = NSURL(string: "https://ovahsen.create.stedwards.edu/mobilephp/getUsers.php")
        let data = NSData(contentsOf: url! as URL)
        values = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //print(values)
        tblUsers.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData()
    }
}
