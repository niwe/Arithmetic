//
//  Aritmetic.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

protocol Arithmetic
{
    var title: String {get set}
    var symbol: String {get set}
    var id: String {get set}
    
    var difficulties: String {get set}
    
    /*
    init (id: String, title: String, symbol: String)
    {
        self.id = id
        self.title = title
        self.symbol = symbol
    }
     */
}
