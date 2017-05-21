//
//  ViewController.swift
//  Animation
//
//  Created by Olivia Vahsen on 5/3/17.
//  Copyright © 2017 Olivia Vahsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gSquare: UIView?
    
    var rSquare:UIView?
    
    var animation: UIDynamicAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create the shapes
        let dimension = CGRect(x: 30, y: 30, width: 75, height: 75)
        gSquare = UIView(frame: dimension)
        gSquare?.backgroundColor = UIColor.green
        
        self.view.addSubview(gSquare!)
        
        let dimension2 = CGRect(x: 130, y: 25, width: 90, height: 90)
        rSquare = UIView(frame: dimension2)
        rSquare?.backgroundColor = UIColor.red
        
        self.view.addSubview(rSquare!)
        
        animation = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: [gSquare!, rSquare!])
        let direction = CGVector(dx: 0, dy: 1)
        gravity.gravityDirection = direction
        
        animation?.addBehavior(gravity)
        
        let bound = UICollisionBehavior(items: [gSquare!, rSquare!])
        bound.translatesReferenceBoundsIntoBoundary = true
        
        animation?.addBehavior(bound)
        
        let bounce = UIDynamicItemBehavior(items: [gSquare!, rSquare!])
        bounce.elasticity = 20
        
        animation?.addBehavior(bounce)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

