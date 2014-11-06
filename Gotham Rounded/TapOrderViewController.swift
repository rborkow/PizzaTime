//
//  TapOrderViewController.swift
//  PizzaTime
//
//  Created by Jayne Vidheecharoen on 10/18/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class TapOrderViewController: UIViewController {

    @IBOutlet weak var orderButton: UIButton!
    
    var tapOrderViewController :UIViewController!
    var confirmationViewController :UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton.hidden = true

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        tapOrderViewController = storyboard.instantiateViewControllerWithIdentifier("TapOrderViewController") as UIViewController
        confirmationViewController = storyboard.instantiateViewControllerWithIdentifier("ConfirmationViewController") as UIViewController

    }
    
    override func viewDidAppear(animated: Bool) {
        orderButton.hidden = false
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as ConfirmationViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ConfirmationViewController
        
    }


}
