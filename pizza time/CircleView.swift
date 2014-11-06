//
//  CircleView.swift
//  Rock Box
//
//  Created by Robert Borkowski on 11/5/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class CircleView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawRect(rect: CGRect) {
        // Get the Graphics Context
        var context = UIGraphicsGetCurrentContext();
        
        // Set the circle outerline-width
        CGContextSetLineWidth(context, 1.0);
        
        // Set the circle outerline-colour
        randomColor().set()
        
        // Create Circle
        CGContextAddArc(context, (frame.size.width)/2, frame.size.height/2, (frame.size.width - 4)/2, 0.0, CGFloat(M_PI * 2.0), 1)
        
        // Draw
        CGContextStrokePath(context);
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(CGFloat(arc4random()%100000)/100000);
        let green = CGFloat(CGFloat(arc4random()%100000)/100000);
        let blue = CGFloat(CGFloat(arc4random()%100000)/100000);
        
        return UIColor(red: red, green: green, blue: blue, alpha: 0.85);
    }

}
