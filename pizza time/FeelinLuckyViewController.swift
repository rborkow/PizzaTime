//
//  FeelinLuckyViewController.swift
//  PizzaTime
//
//  Created by Alli Dryer on 10/21/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class FeelinLuckyViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pizzaImageView: UIImageView!
    @IBOutlet weak var tryButton: UIButton!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    var pizzaOven = [String : UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pizzaOven["EVERYTHING"] = UIImage(named: "everything.png")
        pizzaOven["PEPPERONI & BELL PEPPER"] = UIImage(named: "pepperoni_bell.png")
        pizzaOven["PEPPERONI & PINEAPPLE"] = UIImage(named: "pepperoni_pineapple.png")
        pizzaOven["VEGGIE"] = UIImage(named: "veggie.png")
        pizzaOven["PEPPERONI"] = UIImage(named: "pepperoni_pie.png")
        
        let index: Int = Int(arc4random_uniform(UInt32(pizzaOven.count)))
        let randomVal = Array(pizzaOven.values)[index]
        let randomLabel = Array(pizzaOven.keys)[index]
        
        pizzaImageView.image = randomVal
        pizzaLabel.text = randomLabel
        
        pizzaLabel.alpha = 0
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-320, 0)
        self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.pizzaLabel.alpha = 1
                })
        }
    }
    
   
    @IBAction func onTryButtonPress(sender: AnyObject) {
        let index: Int = Int(arc4random_uniform(UInt32(pizzaOven.count)))
        let randomVal = Array(pizzaOven.values)[index]
        let randomLabel = Array(pizzaOven.keys)[index]
        
        pizzaImageView.image = randomVal
        pizzaLabel.text = randomLabel
        
        self.pizzaLabel.alpha = 0
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(0.4, 0.4)
            let translate = CGAffineTransformMakeTranslation(260, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                self.pizzaImageView.alpha = 0
                UIView.animateWithDuration(0.001, animations: { () -> Void in
                    self.pizzaImageView.transform = CGAffineTransformMakeTranslation(0, 0)
                    }) { (finished: Bool) -> Void in
                        UIView.animateWithDuration(0.001, animations: { () -> Void in
                            self.pizzaImageView.transform = CGAffineTransformMakeTranslation(-260, 0)
                            }) { (finished: Bool) -> Void in
                                UIView.animateWithDuration(0.001, animations: { () -> Void in
                                    self.pizzaLabel.alpha = 1
                                    }) { (finished: Bool) -> Void in
                                        self.pizzaImageView.alpha = 1
                                        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                            let scale = CGAffineTransformMakeScale(1, 1)
                                            let translate = CGAffineTransformMakeTranslation(0, 0)
                                            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
                                            }) { (finished: Bool) -> Void in
                                        }
                                }
                        }
                }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            let scale = CGAffineTransformMakeScale(0.4, 0.4)
            let translate = CGAffineTransformMakeTranslation(260, 0)
            self.pizzaImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
        }
    }
    
    @IBAction func onBackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
