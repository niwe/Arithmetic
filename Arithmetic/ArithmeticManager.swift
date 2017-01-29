//
//  ArithmeticManager.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class ArithmeticManager: NSObject
{
    static var arithmetics = [Arithmetic]()

    class func AddArithmetic(id: String, title: String, symbol: String)
    {
        let a = Arithmetic(id: id, title: title, symbol: symbol)
        
        arithmetics.append(a)
    }
}
