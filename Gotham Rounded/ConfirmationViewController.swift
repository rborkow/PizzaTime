//
//  ConfirmationViewController.swift
//  PizzaTime
//
//  Created by Jayne Vidheecharoen on 10/18/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit


class ConfirmationViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    var timeRemaining: Int = 15

    @IBOutlet weak var timeLabel: UILabel!
   
    @IBOutlet weak var pizzaWedge: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var etaView: UIView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var mapImageView: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        etaView.frame.origin.y = 568
        //pizzaWedge.center.y = 200
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
        self.etaView.frame.origin.y = 343
        self.pizzaWedge.center.y = 175
        self.orderButton.transform = CGAffineTransformScale(self.orderButton.transform, CGFloat(0.2), CGFloat(0.2))
        self.orderButton.center.y = 275
        }, completion: { (finished: Bool) -> Void in
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.Repeat , animations: { () -> Void in
        self.pizzaWedge.center.y = 190
        }, completion: nil)
        })
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        delay(14, closure: { () -> () in
        
        self.performSegueWithIdentifier("orderReadySeg", sender: self)
        })
        
    }
    
    func update() {
        timeRemaining = timeRemaining - 1
        timeLabel.text = String(timeRemaining)
        mapImageView.center.y =  mapImageView.center.y - 10
            
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0

            UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                self.etaView.frame.origin.y = 343
                self.pizzaWedge.center.y = 175
                self.orderButton.transform = CGAffineTransformScale(self.orderButton.transform, CGFloat(0.2), CGFloat(0.2))
                self.orderButton.center.y = 275
        
            }, completion: nil)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                })
                { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            
            UIView.animateWithDuration(0.6, delay: 0, options: nil, animations: { () -> Void in
                self.etaView.frame.origin.y = 500
                self.pizzaWedge.center.y = 220
                self.orderButton.transform = CGAffineTransformScale(self.orderButton.transform, CGFloat(3.25), CGFloat(3.25))
                self.orderButton.center.y = 300
                
                fromViewController.view.alpha = 0

                
                }) { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    @IBAction func onCancel(sender: UIButton) {
        
        var alert = UIAlertController(title: "Cancel Order", message: "Sure you want to cancel your Pizza Time order?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Nevermind", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        alert.addAction(UIAlertAction(title: "Cancel Order", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                self.dismissViewControllerAnimated(true, completion: nil)
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))

    }
   
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

//    @IBAction func onTapDot(sender: UIButton) {
//    
//        UIView.animateWithDuration(0.6, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.Repeat , animations: { () -> Void in
//            self.pizzaWedge.center.y = 200
//        }, completion: nil)
//    
//    }


}
