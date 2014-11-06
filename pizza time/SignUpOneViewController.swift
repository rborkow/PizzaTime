//
//  SignUpOneViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/21/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class SignUpOneViewController: UIViewController {
    @IBOutlet weak var introText: UIImageView!
    @IBOutlet weak var formBg: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
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
        var startLocation:Array = [85,175,183,227,273,316, 382]
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.introText.frame.origin.y = CGFloat(Float(startLocation[0]) - self.distanceShift)
            self.formBg.frame.origin.y = CGFloat(Float(startLocation[1]) - self.distanceShift)
            self.firstNameField.frame.origin.y = CGFloat(Float(startLocation[2]) - self.distanceShift)
            self.lastNameField.frame.origin.y = CGFloat(Float(startLocation[3]) - self.distanceShift)
            self.phoneNumberField.frame.origin.y = CGFloat(Float(startLocation[4]) - self.distanceShift)
            self.passwordField.frame.origin.y = CGFloat(Float(startLocation[5]) - self.distanceShift)
            self.nextButton.frame.origin.y = CGFloat(Float(startLocation[6]) - self.distanceShift)
            
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
        var startLocation:Array = [85,175,183,227,273,316, 382]
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            //
            self.introText.frame.origin.y = CGFloat(Float(startLocation[0]))
            self.formBg.frame.origin.y = CGFloat(Float(startLocation[1]))
            self.firstNameField.frame.origin.y = CGFloat(Float(startLocation[2]))
            self.lastNameField.frame.origin.y = CGFloat(Float(startLocation[3]))
            self.phoneNumberField.frame.origin.y = CGFloat(Float(startLocation[4]))
            self.passwordField.frame.origin.y = CGFloat(Float(startLocation[5]))
            self.nextButton.frame.origin.y = CGFloat(Float(startLocation[6]))
            
            }, completion: nil)
    }
    
    

    @IBAction func OnTapBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onTapNext(sender: AnyObject) {
        self.performSegueWithIdentifier("nextStepSegue", sender: self)
        // check strings
        if(self.firstNameField.text == "") {
            println("nothing")
        } else {
            println("filled in")
        }  
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as SignUpTwoViewController
        destinationViewController.firstNameText = self.firstNameField.text
        destinationViewController.lastNameText = self.lastNameField.text
    }
    
    
}
