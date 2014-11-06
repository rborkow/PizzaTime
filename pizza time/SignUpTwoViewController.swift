//
//  SignUpTwoViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/21/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SignUpTwoViewController: UIViewController {
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var creditCardTextField: UITextField!
    @IBOutlet weak var expDateTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var formBgImage: UIImageView!
    @IBOutlet weak var allSetButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    var distanceShift:Float = 20
    
    var firstNameText : String!
    var lastNameText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        firstNameTextField.text = firstNameText
        lastNameTextField.text = lastNameText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // delay
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        var startLocation:Array = [100,145,190,234, 234, 92,317, 372]
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.firstNameTextField.frame.origin.y = CGFloat(Float(startLocation[0]) - self.distanceShift)
            self.lastNameTextField.frame.origin.y = CGFloat(Float(startLocation[1]) - self.distanceShift)
            self.creditCardTextField.frame.origin.y = CGFloat(Float(startLocation[2]) - self.distanceShift)
            self.expDateTextField.frame.origin.y = CGFloat(Float(startLocation[3]) - self.distanceShift)
            self.codeTextField.frame.origin.y = CGFloat(Float(startLocation[4]) - self.distanceShift)
            self.formBgImage.frame.origin.y = CGFloat(Float(startLocation[5]) - self.distanceShift)
            self.allSetButton.frame.origin.y = CGFloat(Float(startLocation[6]) - (self.distanceShift + 30))
            self.skipButton.frame.origin.y = CGFloat(Float(startLocation[7]) - (self.distanceShift + 38))
            self.loadingActivityView.frame.origin.y = CGFloat(328 - (self.distanceShift + 30) )
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        var startLocation:Array = [100,145,190,234, 234,92,317,372]
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.firstNameTextField.frame.origin.y = CGFloat(Float(startLocation[0]))
            self.lastNameTextField.frame.origin.y = CGFloat(Float(startLocation[1]))
            self.creditCardTextField.frame.origin.y = CGFloat(Float(startLocation[2]))
            self.expDateTextField.frame.origin.y = CGFloat(Float(startLocation[3]))
            self.codeTextField.frame.origin.y = CGFloat(Float(startLocation[4]))
            self.formBgImage.frame.origin.y = CGFloat(Float(startLocation[5]))
            self.allSetButton.frame.origin.y = CGFloat(Float(startLocation[6]))
            self.skipButton.frame.origin.y = CGFloat(Float(startLocation[7]))
            self.loadingActivityView.frame.origin.y = CGFloat(328)
            
            }, completion: nil)
    }
    
    

    @IBAction func OnTapBackButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onTapAllSetButton(sender: AnyObject) {
        loadingActivityView.startAnimating()
        
        delay(1, closure: { () -> () in
            self.performSegueWithIdentifier("signUpSegue", sender: self)
            self.loadingActivityView.stopAnimating()
            //self.loginButton.selected = false
            }
        )
        
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func onTapWithoutCC(sender: UIButton) {
        loadingActivityView.startAnimating()
        
        delay(1, closure: { () -> () in
            self.performSegueWithIdentifier("signUpSegue", sender: self)
            self.loadingActivityView.stopAnimating()
            //self.loginButton.selected = false
            }
        )
    }

}
