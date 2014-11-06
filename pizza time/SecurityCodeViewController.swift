//
//  SecurityCodeViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/27/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SecurityCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTapBackButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
