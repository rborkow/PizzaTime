//
//  SettingsViewController.swift
//  PizzaTime
//
//  Created by Alli Dryer on 10/5/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onSettingsBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTapBackButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTapLogOut(sender: UIButton) {
    }
}
