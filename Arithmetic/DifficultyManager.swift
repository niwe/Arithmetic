//
//  DifficultyManager.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class DifficultyManager: NSObject
{
    static var difficulty = [String]()
    
    class func AddDifficulty(title: String)
    {
        let d = title
        
        difficulty.append(d)
    }
}
