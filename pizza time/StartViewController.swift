//
//  StartViewController.swift
//  Pizza Time
//
//  Created by David Bellona on 10/21/14.
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollImage: UIImageView!

    @IBOutlet weak var pizzaTimeTitle: UILabel!
    @IBOutlet weak var pizzaCrustImage: UIImageView!
    @IBOutlet weak var sauceImage: UIImageView!
    @IBOutlet weak var cheeseImage: UIImageView!
    
    @IBOutlet weak var redOnionOneImage: UIImageView!
    @IBOutlet weak var redOnionTwoImage: UIImageView!
    @IBOutlet weak var redOnionThreeImage: UIImageView!
    @IBOutlet weak var redOnionFourImage: UIImageView!
    @IBOutlet weak var redOnionFiveImage: UIImageView!
    @IBOutlet weak var redOnionSixImage: UIImageView!
    @IBOutlet weak var mushroomOneImage: UIImageView!
    @IBOutlet weak var mushroomTwoImage: UIImageView!
    @IBOutlet weak var mushroomThreeImage: UIImageView!
    @IBOutlet weak var mushroomFourImage: UIImageView!
    @IBOutlet weak var mushroomFiveImage: UIImageView!
    @IBOutlet weak var pepOneImage: UIImageView!
    @IBOutlet weak var pepTwoImage: UIImageView!
    @IBOutlet weak var pepThreeImage: UIImageView!
    @IBOutlet weak var pepFourImage: UIImageView!
    @IBOutlet weak var pepFiveImage: UIImageView!
    @IBOutlet weak var pepSixImage: UIImageView!
    @IBOutlet weak var pepImageSeven: UIImageView!
    @IBOutlet weak var pepImageEight: UIImageView!
    
    
    // six items
    var startYOffsetOnion : [Float] = [-250, -350, -200, -200, -200, -250]
    var startXOffsetOnion : [Float] = [-150, 100, -100, 150, 175, -175]
    
    // five items
    var startYOffsetMushroom : [Float] = [-100, -150, -200, -250, -300]
    var startXOffsetMushroom : [Float] = [-50, 340, -60, 340, -100]
    
    //eight items
    var startYOffsetPep : [Float] = [-100, -150, -200, -250, -300, -350, -400, -450]
    var startXOffsetPep : [Float] = [-20, 340, -20, 340, -20, 340, -20, 340]
    
    //start variations
    var startScale : [Float] = [1.7, 1.7, 1.7, 1.7, 1.7, 1.7]
    var startRotations : [Float] = [0, 0, 0, 0, 0, 0, 0]
    
    // end rotations
    var rotations : [Float] = [15, 45, 90, 135, 180, 235, 0]
    
    
    override func viewDidAppear(animated: Bool) {
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollImage.frame.size
        scrollView.sendSubviewToBack(scrollImage)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
       
        var offset = Float(scrollView.contentOffset.y)
        
        
        var titlePy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 400, r2Max: 0)
        var titlePx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 0)
        
        //onions
        var rOney = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[0], r2Max: 0)
        var rOnex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[0], r2Max: 0)
        var rTwoy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[1], r2Max: 0)
        var rTwox = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[1], r2Max: 0)
        var rThreey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[2], r2Max: 0)
        var rThreex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[2], r2Max: 0)
        var rFoury = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[3], r2Max: 0)
        var rFourx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[3], r2Max: 0)
        var rFivey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[4], r2Max: 0)
        var rFivex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[4], r2Max: 0)
        var rSixy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetOnion[5], r2Max: 0)
        var rSixx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetOnion[5], r2Max: 0)
        
        //mushrooms
        var mOney = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetMushroom[0], r2Max: 0)
        var mOnex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetMushroom[0], r2Max: 0)
        var mTwoy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetMushroom[1], r2Max: 0)
        var mTwox = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetMushroom[1], r2Max: 0)
        var mThreey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetMushroom[2], r2Max: 0)
        var mThreex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetMushroom[2], r2Max: 0)
        var mFoury = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetMushroom[3], r2Max: 0)
        var mFourx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetMushroom[3], r2Max: 0)
        var mFivey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetMushroom[4], r2Max: 0)
        var mFivex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetMushroom[4], r2Max: 0)
        
        //pepperoni
        var pOney = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[0], r2Max: 0)
        var pOnex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[0], r2Max: 0)
        var pTwoy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[1], r2Max: 0)
        var pTwox = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[1], r2Max: 0)
        var pThreey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[2], r2Max: 0)
        var pThreex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[2], r2Max: 0)
        var pFoury = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[3], r2Max: 0)
        var pFourx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[3], r2Max: 0)
        var pFivey = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[4], r2Max: 0)
        var pFivex = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[4], r2Max: 0)
        var pSixy = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[5], r2Max: 0)
        var pSixx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[5], r2Max: 0)
        var pSeveny = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[6], r2Max: 0)
        var pSevenx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[6], r2Max: 0)
        var pEighty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startYOffsetPep[7], r2Max: 0)
        var pEightx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startXOffsetPep[7], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: startScale[0], r2Max: 1)
        var scaleTitle = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 1)
        
        var rotationOne = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[0])
        var rotationTwo = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[1])
        var rotationThree = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[2])
        var rotationFour = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[3])
        var rotationFive = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[4])
        var rotationSix = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: rotations[5])
        
        // title
        pizzaTimeTitle.transform = CGAffineTransformMakeTranslation(CGFloat(titlePx), CGFloat(titlePy))
        pizzaTimeTitle.transform = CGAffineTransformScale(pizzaTimeTitle.transform, CGFloat(scaleTitle), CGFloat(scaleTitle))
        
        //onions
        redOnionOneImage.transform = CGAffineTransformMakeTranslation(CGFloat(rOnex), CGFloat(rOney))
        redOnionOneImage.transform = CGAffineTransformScale(redOnionOneImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionOneImage.transform = CGAffineTransformRotate(redOnionOneImage.transform, CGFloat(Double(rotationOne) * M_PI / 180))
        redOnionTwoImage.transform = CGAffineTransformMakeTranslation(CGFloat(rTwox), CGFloat(rTwoy))
        redOnionTwoImage.transform = CGAffineTransformScale(redOnionTwoImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionTwoImage.transform = CGAffineTransformRotate(redOnionTwoImage.transform, CGFloat(Double(rotationTwo) * M_PI / 180))
        
        redOnionThreeImage.transform = CGAffineTransformMakeTranslation(CGFloat(rThreex), CGFloat(rThreey))
        redOnionThreeImage.transform = CGAffineTransformScale(redOnionThreeImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionThreeImage.transform = CGAffineTransformRotate(redOnionThreeImage.transform, CGFloat(Double(rotationThree) * M_PI / 180))
        
        redOnionFourImage.transform = CGAffineTransformMakeTranslation(CGFloat(rFourx), CGFloat(rFoury))
        redOnionFourImage.transform = CGAffineTransformScale(redOnionFourImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionFourImage.transform = CGAffineTransformRotate(redOnionFourImage.transform, CGFloat(Double(rotationFour) * M_PI / 180))
        
        redOnionFiveImage.transform = CGAffineTransformMakeTranslation(CGFloat(rFivex), CGFloat(rFivey))
        redOnionFiveImage.transform = CGAffineTransformScale(redOnionFiveImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionFiveImage.transform = CGAffineTransformRotate(redOnionFiveImage.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        redOnionSixImage.transform = CGAffineTransformMakeTranslation(CGFloat(pSixx), CGFloat(pSixy))
        redOnionSixImage.transform = CGAffineTransformScale(redOnionSixImage.transform, CGFloat(scale), CGFloat(scale))
        redOnionSixImage.transform = CGAffineTransformRotate(redOnionSixImage.transform, CGFloat(Double(rotationOne) * M_PI / 180))
        
        //mushrooms
        mushroomOneImage.transform = CGAffineTransformMakeTranslation(CGFloat(mOnex), CGFloat(mOney))
        mushroomOneImage.transform = CGAffineTransformScale(mushroomOneImage.transform, CGFloat(scale), CGFloat(scale))
        mushroomOneImage.transform = CGAffineTransformRotate(mushroomOneImage.transform, CGFloat(Double(rotationOne) * M_PI / 180))
        mushroomTwoImage.transform = CGAffineTransformMakeTranslation(CGFloat(mTwox), CGFloat(mTwoy))
        mushroomTwoImage.transform = CGAffineTransformScale(mushroomTwoImage.transform, CGFloat(scale), CGFloat(scale))
        mushroomTwoImage.transform = CGAffineTransformRotate(mushroomTwoImage.transform, CGFloat(Double(rotationTwo) * M_PI / 180))
        
        mushroomThreeImage.transform = CGAffineTransformMakeTranslation(CGFloat(mThreex), CGFloat(mThreey))
        mushroomThreeImage.transform = CGAffineTransformScale(mushroomThreeImage.transform, CGFloat(scale), CGFloat(scale))
        mushroomThreeImage.transform = CGAffineTransformRotate(mushroomThreeImage.transform, CGFloat(Double(rotationThree) * M_PI / 180))
        
        mushroomFourImage.transform = CGAffineTransformMakeTranslation(CGFloat(mFourx), CGFloat(mFoury))
        mushroomFourImage.transform = CGAffineTransformScale(mushroomFourImage.transform, CGFloat(scale), CGFloat(scale))
        mushroomFourImage.transform = CGAffineTransformRotate(mushroomFourImage.transform, CGFloat(Double(rotationFour) * M_PI / 180))
        
        mushroomFiveImage.transform = CGAffineTransformMakeTranslation(CGFloat(mFivex), CGFloat(mFivey))
        mushroomFiveImage.transform = CGAffineTransformScale(mushroomFiveImage.transform, CGFloat(scale), CGFloat(scale))
        mushroomFiveImage.transform = CGAffineTransformRotate(mushroomFiveImage.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        //pepperoni
        pepOneImage.transform = CGAffineTransformMakeTranslation(CGFloat(pOnex), CGFloat(pOney))
        pepOneImage.transform = CGAffineTransformScale(pepOneImage.transform, CGFloat(scale), CGFloat(scale))
        pepOneImage.transform = CGAffineTransformRotate(pepOneImage.transform, CGFloat(Double(rotationOne) * M_PI / 180))
        pepTwoImage.transform = CGAffineTransformMakeTranslation(CGFloat(pTwox), CGFloat(pTwoy))
        pepTwoImage.transform = CGAffineTransformScale(pepTwoImage.transform, CGFloat(scale), CGFloat(scale))
        pepTwoImage.transform = CGAffineTransformRotate(pepTwoImage.transform, CGFloat(Double(rotationTwo) * M_PI / 180))
        
        pepThreeImage.transform = CGAffineTransformMakeTranslation(CGFloat(pThreex), CGFloat(pThreey))
        pepThreeImage.transform = CGAffineTransformScale(pepThreeImage.transform, CGFloat(scale), CGFloat(scale))
        pepThreeImage.transform = CGAffineTransformRotate(pepThreeImage.transform, CGFloat(Double(rotationThree) * M_PI / 180))
        
        pepFourImage.transform = CGAffineTransformMakeTranslation(CGFloat(pFourx), CGFloat(pFoury))
        pepFourImage.transform = CGAffineTransformScale(pepFourImage.transform, CGFloat(scale), CGFloat(scale))
        pepFourImage.transform = CGAffineTransformRotate(pepFourImage.transform, CGFloat(Double(rotationFour) * M_PI / 180))
        
        pepFiveImage.transform = CGAffineTransformMakeTranslation(CGFloat(pFivex), CGFloat(pFivey))
        pepFiveImage.transform = CGAffineTransformScale(pepFiveImage.transform, CGFloat(scale), CGFloat(scale))
        pepFiveImage.transform = CGAffineTransformRotate(pepFiveImage.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        pepSixImage.transform = CGAffineTransformMakeTranslation(CGFloat(pSixx), CGFloat(pSixy))
        pepSixImage.transform = CGAffineTransformScale(pepSixImage.transform, CGFloat(scale), CGFloat(scale))
        pepSixImage.transform = CGAffineTransformRotate(pepSixImage.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        pepImageSeven.transform = CGAffineTransformMakeTranslation(CGFloat(pSevenx), CGFloat(pSeveny))
        pepImageSeven.transform = CGAffineTransformScale(pepImageSeven.transform, CGFloat(scale), CGFloat(scale))
        pepImageSeven.transform = CGAffineTransformRotate(pepImageSeven.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
        pepImageEight.transform = CGAffineTransformMakeTranslation(CGFloat(pEightx), CGFloat(pEighty))
        pepImageEight.transform = CGAffineTransformScale(pepImageEight.transform, CGFloat(scale), CGFloat(scale))
        pepImageEight.transform = CGAffineTransformRotate(pepImageEight.transform, CGFloat(Double(rotationFive) * M_PI / 180))
        
    }
    

}
