//
//  BeerViewController.swift
//  pizza time
//
//  Created by Alli Dryer on 11/5/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var isPresenting: Bool = true

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var beerfoamImageView: UIImageView!
    @IBOutlet weak var beerLiquidImageView: UIImageView!
    @IBOutlet weak var glassImageView: UIImageView!
    @IBOutlet weak var sixerActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nahActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-320, 0)
        self.beerfoamImageView.transform = CGAffineTransformConcat(scale, translate)
        self.beerLiquidImageView.transform = CGAffineTransformConcat(scale, translate)
        self.glassImageView.transform = CGAffineTransformConcat(scale, translate)
               
        sixerActivityIndicator.hidesWhenStopped = true
        nahActivityIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.beerfoamImageView.transform = CGAffineTransformConcat(scale, translate)
            self.beerLiquidImageView.transform = CGAffineTransformConcat(scale, translate)
            self.glassImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
            //
        }
       
        delay(0.3) {
        srand48(Int(NSDate().timeIntervalSince1970))
        
        // SMALL YELLOW loop from 0 to 9
        for i in 0...12 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 8, height: 8)
            square.layer.cornerRadius = 4
            square.backgroundColor = UIColor(red: 255/255, green: 227/255, blue: 1/255, alpha: 0.5)
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomXOffset = CGFloat( drand48() * 65)
            
            // create the animation
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 135 + randomXOffset, y: 370))
            path.addCurveToPoint(CGPointMake(135 + randomXOffset, 336), controlPoint1: CGPointMake(135 + randomXOffset, 384), controlPoint2: CGPointMake(138.5 + randomXOffset, 349.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 299.5), controlPoint1: CGPointMake(131.5 + randomXOffset, 322.5), controlPoint2: CGPointMake(131.5 + randomXOffset, 311.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 255.5), controlPoint1: CGPointMake(139.5 + randomXOffset, 287.5), controlPoint2: CGPointMake(138.5 + randomXOffset, 268.5))
            path.addCurveToPoint(CGPointMake(130.5 + randomXOffset, 217.5), controlPoint1: CGPointMake(132.5 + randomXOffset, 242.5), controlPoint2: CGPointMake(127.5 + randomXOffset, 231.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 181.5), controlPoint1: CGPointMake(133.5 + randomXOffset, 203.5), controlPoint2: CGPointMake(137.5  + randomXOffset, 188.5))
            path.addCurveToPoint(CGPointMake(130 + randomXOffset, 158), controlPoint1: CGPointMake(133.5 + randomXOffset, 174.5), controlPoint2: CGPointMake(130 + randomXOffset, 158))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = 290 * drand48()
            
            // each square will take between 4.0 and 8.0 seconds
            // to complete one animation loop
            anim.duration = 1.5 + 3 * drand48()
            
            // add the animation
            square.layer.addAnimation(anim, forKey: "animate position along path")
        }
        
        // BIG YELLOW loop from 0 to 5
        for i in 0...5 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 14, height: 14)
            square.layer.cornerRadius = 7
            square.backgroundColor = UIColor(red: 255/255, green: 234/255, blue: 67/255, alpha: 0.5)
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomXOffset = CGFloat( drand48() * 65)
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            
            // create the animation
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 135 + randomXOffset, y: 370))
            path.addCurveToPoint(CGPointMake(135 + randomXOffset, 336), controlPoint1: CGPointMake(135 + randomXOffset, 384), controlPoint2: CGPointMake(138.5 + randomXOffset, 349.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 299.5), controlPoint1: CGPointMake(131.5 + randomXOffset, 322.5), controlPoint2: CGPointMake(131.5 + randomXOffset, 311.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 255.5), controlPoint1: CGPointMake(139.5 + randomXOffset, 287.5), controlPoint2: CGPointMake(138.5 + randomXOffset, 268.5))
            path.addCurveToPoint(CGPointMake(130.5 + randomXOffset, 217.5), controlPoint1: CGPointMake(132.5 + randomXOffset, 242.5), controlPoint2: CGPointMake(127.5 + randomXOffset, 231.5))
            path.addCurveToPoint(CGPointMake(135.5 + randomXOffset, 181.5), controlPoint1: CGPointMake(133.5 + randomXOffset, 203.5), controlPoint2: CGPointMake(137.5  + randomXOffset, 188.5))
            path.addCurveToPoint(CGPointMake(130 + randomXOffset, 158), controlPoint1: CGPointMake(133.5 + randomXOffset, 174.5), controlPoint2: CGPointMake(130 + randomXOffset, 158))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = 290 * drand48()
            
            // each square will take between 4.0 and 8.0 seconds
            // to complete one animation loop
            anim.duration = 1.5 + 3 * drand48()
            
            // add the animation
            square.layer.addAnimation(anim, forKey: "animate position along path")
            }
        }
    }
    
    @IBAction func onAddButtonPressed(sender: AnyObject) {
        sixerActivityIndicator.startAnimating()
        
        delay(2, closure: { () -> () in
            self.performSegueWithIdentifier("sixerToConfirmation", sender: self)
            self.sixerActivityIndicator.stopAnimating()
        })
    }
    
    @IBAction func onNahButtonPressed(sender: AnyObject) {
        nahActivityIndicator.startAnimating()
        
        delay(2, closure: { () -> () in
            self.performSegueWithIdentifier("nahToConfirmation", sender: self)
            self.nahActivityIndicator.stopAnimating()
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "sixerToConfirmation"{
            var destinationVC = segue.destinationViewController as OrderSubmittedViewController
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = destinationVC as OrderSubmittedViewController
            
            destinationVC.glassImageView = glassImageView
            destinationVC.beerfoamImageView = beerfoamImageView
            destinationVC.beerLiquidImageView = beerLiquidImageView
        
        } else if segue.identifier == "nahToConfirmation"{
            var destinationVC = segue.destinationViewController as OrderSubmittedViewController
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = destinationVC as OrderSubmittedViewController
            
            destinationVC.glassImageView = glassImageView
            destinationVC.beerfoamImageView = beerfoamImageView
            destinationVC.beerLiquidImageView = beerLiquidImageView
        }
    }

    @IBAction func onBackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
