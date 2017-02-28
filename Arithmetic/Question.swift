//
//  Question.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-02-28.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import Foundation

class Question
{
    var tokens: [String] = []
    var useCount: Int = 0
    
    
    func renderQuestion() -> String
    {
        var question = ""
        
        if tokens.count > 2
        {
            question = tokens.joined(separator: " ")
        }
        
        useCount += 1
        
        return question
    }
}
