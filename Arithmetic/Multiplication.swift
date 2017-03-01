//
//  Multiplication.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class Multiplication: Arithmetic
{
    var title = "Gånger"
    var id = "multi"
    var symbol = "x"
    var difficulties: [Difficulty] = []
    var questionHistory: [(hash: String, (firstNumber:Int, secondNumber:Int))] = []
    
    
    func setup()
    {
        difficulties.append(Difficulty("1", "1x", "1:ans gångertabell", questionFactory(0, 9, 1)))
        difficulties.append(Difficulty("2", "2x", "2:ans gångertabell", questionFactory(0, 9, 2)))
        difficulties.append(Difficulty("3", "3x", "3:ans gångertabell", questionFactory(0, 9, 3)))
        difficulties.append(Difficulty("4", "4x", "4:ans gångertabell", questionFactory(0, 9, 4)))
        difficulties.append(Difficulty("5", "5x", "5:ans gångertabell", questionFactory(0, 9, 5)))
        difficulties.append(Difficulty("6", "6x", "6:ans gångertabell", questionFactory(0, 9, 6)))
        difficulties.append(Difficulty("7", "7x", "7:ans gångertabell", questionFactory(0, 9, 7)))
        difficulties.append(Difficulty("8", "8x", "8:ans gångertabell", questionFactory(0, 9, 8)))
        difficulties.append(Difficulty("9", "9x", "9:ans gångertabell", questionFactory(0, 9, 9)))
        difficulties.append(Difficulty("10", "10-tal", "10-tal", questionFactory(0, 100, 10)))
        difficulties.append(Difficulty("11", "11-20", "11-20", questionFactory(11, 21)))
        difficulties.append(Difficulty("12", "Test", "Test", questionFactory2()))
    }
    
    
    func calculate(question: Question) -> Int
    {
        var tokens: [Int] = []
        
        //let b:Int? = Int(secondText.text)
        
        for token in question.tokens
        {
            let number:Int? = Int(token)
            
            if (number != nil)
            {
                tokens.append(number!)
            }
        }
        
        let product = tokens.reduce(1, *)
        
        return product
    }
    
    func questionFactory2() -> () -> [Question]
    {
        func generate() -> [Question]
        {
            var questions: [Question] = []
            
            for _ in 0..<100
            {
                let q = Question()
                q.tokens.append(String(arc4random_uniform(9) + 11))
                q.tokens.append("x")
                q.tokens.append(String(arc4random_uniform(9) + 11))
                questions.append(q)
            }
            
            return questions
        }
        
        return generate
    }
    
    func questionFactory(_ lowestDigit: Int, _ highestDigit: Int) -> () -> [Question]
    {
        func generate() -> [Question]
        {
            var questions: [Question] = []
            
            for i in lowestDigit...highestDigit
            {
                let function = questionFactory(lowestDigit, highestDigit, i)
                questions += function()
            }
            
            return questions
        }
        
        return generate
    }
    
    func questionFactory(_ lowestDigit: Int, _ highestDigit: Int, _ factor: Int) -> () -> [Question]
    {
        func generate() -> [Question]
        {
            var firstFactor: Int
            var secondFactor: Int
            var questions: [Question] = []
            
            firstFactor = factor
            
            for secondFactor in lowestDigit...highestDigit
            {
                let q = Question()
                q.tokens.append(String(firstFactor))
                q.tokens.append("x")
                q.tokens.append(String(secondFactor))
                
                questions.append(q)
            }
            
            secondFactor = factor
            
            for firstFactor in lowestDigit...highestDigit
            {
                let q = Question()
                q.tokens.append(String(firstFactor))
                q.tokens.append("x")
                q.tokens.append(String(secondFactor))
                
                questions.append(q)
            }
        
            return questions
        }
        
        return generate
    }
}
