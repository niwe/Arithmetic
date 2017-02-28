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
    static var difficulty = [Difficulty]()
    
    class func AddDifficulty(_ id: String, _ title: String, function: @escaping () -> [Question])
    {
        let d = Difficulty(id, title, function)
        
        difficulty.append(d)
    }
}


class Difficulty
{
    var id: String
    var title: String
    var function: () -> [Question]
    
    init (_ id: String, _ title: String, _ function: @escaping () -> [Question])
    {
        self.id = id
        self.title = title
        self.function = function
    }
}
