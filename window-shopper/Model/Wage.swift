//
//  Wage.swift
//  window-shopper
//
//  Created by Ryan Hutchison on 4/13/18.
//  Copyright © 2018 Ryan Hutchison. All rights reserved.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
