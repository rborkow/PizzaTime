//
//  OrderSubmittedViewController.swift
//  pizza time
//
//  Created by Alli Dryer on 11/5/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class OrderSubmittedViewController: UIViewController {
    
    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var beverageLabel: UILabel!
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var letYouKnowLabel: UILabel!
    @IBOutlet weak var outForDeliveryLabel: UILabel!
    @IBOutlet weak var prepLabel: UILabel!
    
    var myOrder = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letYouKnowLabel.alpha = 0
        outForDeliveryLabel.alpha = 0
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-280, 0)
        self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
        
        if myOrder.pizzaOrderType == "Lucky" {
           self.pizzaImageView.image = myOrder.luckyImage
        } else if myOrder.pizzaOrderType == "Custom" {
            let views = myOrder.customToppings as Array<UIImageView>
            
            for item in views {
                self.pizzaImageView.addSubview(item)
            }
        }
        
        launchNotification()
        println("Type:\(myOrder.pizzaOrderType), Beer?:\(myOrder.beerWasOrdered), Lucky Image?:\(myOrder.luckyImage), Toppings?:\(myOrder.customToppings)")
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.letYouKnowLabel.alpha = 1
                    self.outForDeliveryLabel.alpha = 1
                })
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(0.4, 0.4)
            let translate = CGAffineTransformMakeTranslation(260, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                self.pizzaImageView.transform = CGAffineTransformMakeTranslation(-280, 0)
                self.beverageLabel.alpha = 0
                self.pizzaLabel.alpha = 0
                self.orderButton.alpha = 0
                self.letYouKnowLabel.alpha = 0
                self.outForDeliveryLabel.alpha = 0
                self.prepLabel.alpha = 0
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
        notification.alertBody = "It's almost pizza time! Your order is on its way!"
        notification.alertAction = "Show me!"
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
