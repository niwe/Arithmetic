//
//  Aritmetic.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class Arithmetic: NSObject
{
    var title: String
    var symbol: String
    var id: String
    
    init (id: String, title: String, symbol: String)
    {
        self.id = id
        self.title = title
        self.symbol = symbol
    }
}
