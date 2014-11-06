//
//  OrderModel.swift
//  pizza time
//
//  Copyright (c) 2014 David Bellona. All rights reserved.
//

import Foundation
import UIKit

class Order {
    var beerWasOrdered: Bool
    var pizzaOrderType: String //"Lucky" or "Custom"
    var luckyImage: UIImage?
    var customToppings: Array<AnyObject>?
    
    init() {
        self.beerWasOrdered = false
        self.pizzaOrderType = "Not Determined"
    }
    
    init(pizzaOrderType: String, luckyImage: UIImage?, customToppings: Array<AnyObject>?) {
        self.pizzaOrderType = pizzaOrderType
        self.beerWasOrdered = false
        if luckyImage != nil {
            self.luckyImage = luckyImage
            self.customToppings = nil
        } else {
            self.luckyImage = nil
            self.customToppings = customToppings
        }
    }
    
    
}