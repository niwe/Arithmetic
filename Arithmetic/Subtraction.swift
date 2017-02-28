//
//  Subtraction.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class Subtraction: Arithmetic
{
    var title = "Minus"
    var id = "sub"
    var symbol = "-"
    //var difficulties = ["5", "10", "20", "50", "100", "200", "500", "1000", "10000"]
    
    var difficulties: [Difficulty] = []
    var questionHistory: [(hash: String, (firstNumber:Int, secondNumber:Int))] = []
    
    func setup() -> ()
    {
        
    }
    
    func calculate(question: Question) -> Int {
        return 0
    }
}
