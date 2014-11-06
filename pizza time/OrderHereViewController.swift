//
//  OrderHereViewController.swift
//  Pizza Time
//
//  Created by Jayne Vidheecharoen on 10/25/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class OrderHereViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "reviewSegue"{
        
            var destinationVC = segue.destinationViewController as ReviewViewController
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = destinationVC as ReviewViewController
        } 
    }


}
