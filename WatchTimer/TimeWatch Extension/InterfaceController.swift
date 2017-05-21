//
//  InterfaceController.swift
//  TimeWatch Extension
//
//  Created by Olivia Vahsen on 5/3/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    @IBOutlet var myTimer: WKInterfaceTimer!
    
    
    @IBAction func startTimer() {
        
        let currentTime = Date()
        myTimer.setDate(currentTime)
        myTimer.start()
        
    }
    
    @IBAction func stopTimer() {
        
        myTimer.stop()
    }
    

}
