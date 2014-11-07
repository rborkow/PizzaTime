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
    @IBOutlet weak var layerCrustImageView: UIImageView!
    @IBOutlet weak var layerSauceImageView: UIImageView!
    @IBOutlet weak var layerCheeseImageView: UIImageView!
    @IBOutlet weak var layerPepperoniImageView: UIImageView!
    @IBOutlet weak var layerPeppersImageView: UIImageView!
    @IBOutlet weak var layerMushroomsImageView: UIImageView!
    @IBOutlet weak var layerPineappleImageView: UIImageView!
    @IBOutlet weak var layerRedOnionImageView: UIImageView!
    @IBOutlet weak var layerOlivesImageView: UIImageView!

    var myOrder = Order()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letYouKnowLabel.alpha = 0
        outForDeliveryLabel.alpha = 0
        
        self.layerCrustImageView.alpha = 0
        self.layerSauceImageView.alpha = 0
        self.layerCheeseImageView.alpha = 0
        self.layerPepperoniImageView.alpha = 0
        self.layerPeppersImageView.alpha = 0
        self.layerMushroomsImageView.alpha = 0
        self.layerPineappleImageView.alpha = 0
        self.layerRedOnionImageView.alpha = 0
        self.layerOlivesImageView.alpha = 0

        
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-280, 0)
        self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
        
        if myOrder.beerWasOrdered == false {
            self.beverageLabel.alpha = 0.0
        }
        
        if myOrder.pizzaOrderType == "Lucky" {
           self.pizzaImageView.image = myOrder.luckyImage
        } else if myOrder.pizzaOrderType == "Custom" {
            let views = myOrder.customToppings as Array<UIImageView>
            self.pizzaImageView.alpha = 0.0
            
            self.layerCrustImageView.alpha = views[0].alpha
            self.layerSauceImageView.alpha = views[1].alpha
            self.layerCheeseImageView.alpha = views[2].alpha
            self.layerPepperoniImageView.alpha = views[3].alpha
            self.layerPeppersImageView.alpha = views[4].alpha
            self.layerMushroomsImageView.alpha = views[5].alpha
            self.layerPineappleImageView.alpha = views[6].alpha
            self.layerRedOnionImageView.alpha = views[8].alpha
            self.layerOlivesImageView.alpha = views[7].alpha
            
        }
        
        launchNotification()

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
