//
//  OrderSubmittedViewController.swift
//  pizza time
//
//  Created by Alli Dryer on 11/5/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class OrderSubmittedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var beverageLabel: UILabel!
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var letYouKnowLabel: UILabel!
    @IBOutlet weak var outForDeliveryLabel: UILabel!
    @IBOutlet weak var prepLabel: UILabel!
    
    var isPresenting: Bool = true
    
    var glassImageView: UIImageView!
    var beerLiquidImageView: UIImageView!
    var beerfoamImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        pizzaImage.alpha = 0
        pizzaLabel.alpha = 0
        beverageLabel.alpha = 0
        letYouKnowLabel.alpha = 0
        outForDeliveryLabel.alpha = 0
        prepLabel.alpha = 0
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-280, 0)
        self.pizzaImage.transform = CGAffineTransformConcat(scale, translate)
        
        // Do any additional setup after loading the view.
        launchNotification()
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
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition order submitted")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                let scale = CGAffineTransformMakeScale(0.4, 0.4)
                let translate = CGAffineTransformMakeTranslation(320, 0)
                self.beerfoamImageView.transform = CGAffineTransformConcat(scale, translate)
                self.beerLiquidImageView.transform = CGAffineTransformConcat(scale, translate)
                self.glassImageView.transform = CGAffineTransformConcat(scale, translate)
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    self.pizzaImage.alpha = 1
                    UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                        let scale = CGAffineTransformMakeScale(1, 1)
                        let translate = CGAffineTransformMakeTranslation(0, 0)
                        self.pizzaImage.transform = CGAffineTransformConcat(scale, translate)
                        }) { (finished: Bool) -> Void in
                            self.prepLabel.alpha = 1
                            UIView.animateWithDuration(0.2, animations: { () -> Void in
                                self.pizzaLabel.alpha = 1
                                self.beverageLabel.alpha = 1
                                self.letYouKnowLabel.alpha = 1
                                self.outForDeliveryLabel.alpha = 1
                            })
                    }

            }
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Notification
    func launchNotification() {
        var notification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        var dateTimeToFire: NSDate = NSDate(timeIntervalSinceNow: 15)
        notification.fireDate = dateTimeToFire
        notification.alertBody = "Whoa dude, Pizza's here!"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
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
