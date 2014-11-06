//
//  ResetViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/27/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet weak var resetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTapBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        view.endEditing(true)
    }
    

}
