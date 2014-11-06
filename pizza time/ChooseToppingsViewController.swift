//
//  ChooseToppingsViewController.swift
//  PizzaTime
//
//  Created by Alli Dryer on 10/21/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class ChooseToppingsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var sauceToppingImageView: UIImageView!
    @IBOutlet weak var cheeseToppingImageView: UIImageView!
    @IBOutlet weak var pepperoniToppingImageView: UIImageView!
    @IBOutlet weak var peppersToppingImageView: UIImageView!
    @IBOutlet weak var mushroomsToppingImageView: UIImageView!
    @IBOutlet weak var pineappleToppingImageView: UIImageView!
    @IBOutlet weak var redOnionToppingImageView: UIImageView!
    @IBOutlet weak var olivesToppingImageView: UIImageView!
    @IBOutlet weak var layerCrustImageView: UIImageView!
    @IBOutlet weak var layerSauceImageView: UIImageView!
    @IBOutlet weak var layerCheeseImageView: UIImageView!
    @IBOutlet weak var layerPepperoniImageView: UIImageView!
    @IBOutlet weak var layerPeppersImageView: UIImageView!
    @IBOutlet weak var layerMushroomsImageView: UIImageView!
    @IBOutlet weak var layerPineappleImageView: UIImageView!
    @IBOutlet weak var layerOlivesImageView: UIImageView!
    @IBOutlet weak var layerRedOnionImageView: UIImageView!
    @IBOutlet weak var sauceRemoveButton: UIButton!
    @IBOutlet weak var cheeseRemoveButton: UIButton!
    @IBOutlet weak var pepperoniRemoveButton: UIButton!
    @IBOutlet weak var peppersRemoveButton: UIButton!
    @IBOutlet weak var mushroomsRemoveButton: UIButton!
    @IBOutlet weak var pineappleRemoveButton: UIButton!
    @IBOutlet weak var redOnionRemoveButton: UIButton!
    @IBOutlet weak var oliveRemoveButton: UIButton!
    
    
    //var tapOrderViewController :UIViewController!
    var confirmationViewController :UIViewController!

    
    var imageCenter: CGPoint!
    var newImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        var scrollWidth = self.view.frame.width
        var scrollHeight = self.scrollView.frame.height
        scrollView.contentSize = CGSizeMake(640 + scrollWidth, scrollHeight)

        layerSauceImageView.alpha = 0
        layerCheeseImageView.alpha = 0
        layerPepperoniImageView.alpha = 0
        layerPeppersImageView.alpha = 0
        layerMushroomsImageView.alpha = 0
        layerPineappleImageView.alpha = 0
        layerOlivesImageView.alpha = 0
        layerRedOnionImageView.alpha = 0
        
        descriptionLabel.alpha = 0
        
        sauceRemoveButton.alpha = 0
        cheeseRemoveButton.alpha = 0
        pepperoniRemoveButton.alpha = 0
        peppersRemoveButton.alpha = 0
        mushroomsRemoveButton.alpha = 0
        pineappleRemoveButton.alpha = 0
        redOnionRemoveButton.alpha = 0
        oliveRemoveButton.alpha = 0
        
        let scale = CGAffineTransformMakeScale(0.4, 0.4)
        let translate = CGAffineTransformMakeTranslation(-280, 0)
        self.layerCrustImageView.transform = CGAffineTransformConcat(scale, translate)
        
        scrollView.contentOffset.x = 640
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.scrollView.contentOffset.x = 0
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.layerCrustImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerSauceImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerCheeseImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPepperoniImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPeppersImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerMushroomsImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPineappleImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerOlivesImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerRedOnionImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.descriptionLabel.alpha = 1
                })
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.descriptionLabel.alpha = 0
            self.scrollView.contentOffset.x = 0
            let scale = CGAffineTransformMakeScale(0.4, 0.4)
            let translate = CGAffineTransformMakeTranslation(280, 0)
            self.layerCrustImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerSauceImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerCheeseImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPepperoniImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPeppersImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerMushroomsImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerPineappleImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerOlivesImageView.transform = CGAffineTransformConcat(scale, translate)
            self.layerRedOnionImageView.transform = CGAffineTransformConcat(scale, translate)
            }) { (finished: Bool) -> Void in
        }

    }
    
    @IBAction func onBackButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //PAN GESTURE RECOGNIZER SECTION
    @IBAction func onSaucePan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            sauceToppingImageView.alpha = 0

        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerSauceImageView.alpha = 1
                    self.sauceToppingImageView.alpha = 1
                    self.sauceRemoveButton.alpha = 1
                    self.descriptionLabel.text = "NICE! WHAT'S NEXT?"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.sauceToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onSauceRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerSauceImageView.alpha = 0
            self.sauceRemoveButton.alpha = 0
            self.descriptionLabel.text = "OK, NO SAUCE FOR YOU!"
        })
    }
    
    @IBAction func onCheesePan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            cheeseToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerCheeseImageView.alpha = 1
                    self.cheeseToppingImageView.alpha = 1
                    self.cheeseRemoveButton.alpha = 1
                    self.descriptionLabel.text = "YUM! ADD SOMETHING ELSE!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.cheeseToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onCheeseRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerCheeseImageView.alpha = 0
            self.cheeseRemoveButton.alpha = 0
            self.descriptionLabel.text = "LACTOSE INTOLERANT?"
        })
    }
    
    @IBAction func onPepperoniPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            pepperoniToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerPepperoniImageView.alpha = 1
                    self.pepperoniToppingImageView.alpha = 1
                    self.pepperoniRemoveButton.alpha = 1
                    self.descriptionLabel.text = "YUM! MOAR TOPPINGS!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.pepperoniToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onPepperoniRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerPepperoniImageView.alpha = 0
            self.pepperoniRemoveButton.alpha = 0
            self.descriptionLabel.text = "NO MEAT ON THIS PIE, AMIRITE?"
        })
    }
    
    @IBAction func onPeppersPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            peppersToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerPeppersImageView.alpha = 1
                    self.peppersToppingImageView.alpha = 1
                    self.peppersRemoveButton.alpha = 1
                    self.descriptionLabel.text = "HOW ABOUT SOME ONIONS?"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.peppersToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onPeppersRemoveButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerPeppersImageView.alpha = 0
            self.peppersRemoveButton.alpha = 0
            self.descriptionLabel.text = "OK, BELL PEPPERS ARE GONE!"
        })
    }
    
    @IBAction func onMushroomsPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            mushroomsToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerMushroomsImageView.alpha = 1
                    self.mushroomsToppingImageView.alpha = 1
                    self.mushroomsRemoveButton.alpha = 1
                    self.descriptionLabel.text = "FUNGUS AMONG US!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.mushroomsToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onMushroomRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerMushroomsImageView.alpha = 0
            self.mushroomsRemoveButton.alpha = 0
            self.descriptionLabel.text = "NO MORE MUSHROOMS FOR YOU!"
        })
    }
    
    @IBAction func onPineapplePan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            pineappleToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerPineappleImageView.alpha = 1
                    self.pineappleToppingImageView.alpha = 1
                    self.pineappleRemoveButton.alpha = 1
                    self.descriptionLabel.text = "YESSSSS - WELL PLAYED!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.pineappleToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onPineappleRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerPineappleImageView.alpha = 0
            self.pineappleRemoveButton.alpha = 0
            self.descriptionLabel.text = "NO LOVE FOR HAWAII?"
        })
    }
    
    @IBAction func onRedOnionPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            redOnionToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerRedOnionImageView.alpha = 1
                    self.redOnionToppingImageView.alpha = 1
                    self.redOnionRemoveButton.alpha = 1
                    self.descriptionLabel.text = "ONION ADDED!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.redOnionToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onRedOnionRemovePressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerRedOnionImageView.alpha = 0
            self.redOnionRemoveButton.alpha = 0
            self.descriptionLabel.text = "NO MORE TEARS!"
        })
    }
    
    @IBAction func onOlivesPan(gestureRecognizer: UIPanGestureRecognizer) {
        var location = gestureRecognizer.locationInView(view)
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            var imageView = gestureRecognizer.view as UIImageView
            newImageView = UIImageView(image: imageView.image)
            self.newImageView.userInteractionEnabled = true
            self.newImageView.frame.size = imageView.frame.size
            self.newImageView.frame.origin = view.convertPoint(imageView.frame.origin, fromView: scrollView)
            view.addSubview(newImageView)
            
            olivesToppingImageView.alpha = 0
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            newImageView.center = location
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            if location.y > 179 && location.y < 423 && location.x > 50 && location.x < 220 {
                newImageView.removeFromSuperview()
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.layerOlivesImageView.alpha = 1
                    self.olivesToppingImageView.alpha = 1
                    self.oliveRemoveButton.alpha = 1
                    self.descriptionLabel.text = "YOU ADDED BLACK OLIVES!"
                })
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.newImageView.removeFromSuperview()
                    self.olivesToppingImageView.alpha = 1
                })
            }
        }
    }
    
    @IBAction func onOliveRemoveButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.layerOlivesImageView.alpha = 0
            self.oliveRemoveButton.alpha = 0
            self.descriptionLabel.text = "NO MORE OLIVES!"
        })
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
        
}
