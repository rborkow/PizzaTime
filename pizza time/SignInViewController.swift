//
//  SignInViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/21/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var introText: UIImageView!
    @IBOutlet weak var formBg: UIImageView!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    
    var distanceShift:Float = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        var startLocation:Array = [85,175,183,227,295,349,305]
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.introText.frame.origin.y = CGFloat(Float(startLocation[0]) - self.distanceShift)
            self.formBg.frame.origin.y = CGFloat(Float(startLocation[1]) - self.distanceShift)
            self.phoneNumberField.frame.origin.y = CGFloat(Float(startLocation[2]) - self.distanceShift)
            self.passwordField.frame.origin.y = CGFloat(Float(startLocation[3]) - self.distanceShift)
            self.signInButton.frame.origin.y = CGFloat(Float(startLocation[4]) - self.distanceShift)
            self.forgotPasswordButton.frame.origin.y = CGFloat(Float(startLocation[5]) - self.distanceShift)
            self.loadingActivityView.frame.origin.y = CGFloat(Float(startLocation[6]) - self.distanceShift)
            
                        
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
        var startLocation:Array = [85,175,183,227,295,349,305]
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.introText.frame.origin.y = CGFloat(Float(startLocation[0]))
            self.formBg.frame.origin.y = CGFloat(Float(startLocation[1]))
            self.phoneNumberField.frame.origin.y = CGFloat(Float(startLocation[2]))
            self.passwordField.frame.origin.y = CGFloat(Float(startLocation[3]))
            self.signInButton.frame.origin.y = CGFloat(Float(startLocation[4]))
            self.forgotPasswordButton.frame.origin.y = CGFloat(Float(startLocation[5]))
            self.loadingActivityView.frame.origin.y = CGFloat(Float(startLocation[6]))
            
            }, completion: nil)
    }

    
    
    @IBAction func onPhoneNumberBegin(sender: UITextField) {
        
    }
    
    
    @IBAction func OnTapBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func onTapSignIn(sender: AnyObject) {
        loadingActivityView.startAnimating()
        
        delay(1, closure: { () -> () in
            if(self.phoneNumberField.text == "1") && (self.passwordField.text == "p") {
                self.phoneNumberField.text = ""
                self.passwordField.text = ""
                self.performSegueWithIdentifier("signInSegue", sender: self)
            } else {
                UIAlertView(title: "Whoops!", message: "Your phone number or password is incorrect", delegate: nil, cancelButtonTitle: "Try again").show()
            }
            self.loadingActivityView.stopAnimating()
            
            //self.loginButton.selected = false
            }
        )
    }

}
