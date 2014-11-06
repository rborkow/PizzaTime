//
//  OrderNowViewController.swift
//  PizzaTime
//
//  Created by Alli Dryer on 10/21/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class OrderNowViewController: UIViewController {

    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var pizzaLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var luckyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pizzaLabel.alpha = 0
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-280, 0)
        self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.pizzaLabel.alpha = 1
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
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
