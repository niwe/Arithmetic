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
    //var difficulties = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var difficulties: [Difficulty] = []
    var questionHistory: [(hash: String, (firstNumber:Int, secondNumber:Int))] = []
    
    
    func setup()
    {
        difficulties.append(Difficulty("1", "1:ans gångertabell", questionFactory(1, 0, 9)))
        difficulties.append(Difficulty("2", "2:ans gångertabell", questionFactory(2, 0, 9)))
        difficulties.append(Difficulty("3", "3:ans gångertabell", questionFactory(3, 0, 9)))
        difficulties.append(Difficulty("4", "4:ans gångertabell", questionFactory(4, 0, 9)))
        difficulties.append(Difficulty("5", "5:ans gångertabell", questionFactory(5, 0, 9)))
        difficulties.append(Difficulty("6", "6:ans gångertabell", questionFactory(6, 0, 9)))
        difficulties.append(Difficulty("7", "7:ans gångertabell", questionFactory(7, 0, 9)))
        difficulties.append(Difficulty("8", "8:ans gångertabell", questionFactory(8, 0, 9)))
        difficulties.append(Difficulty("9", "9:ans gångertabell", questionFactory(9, 0, 9)))
    }
    
    
    func calculate(question: Question) -> Int
    {
        var tokens: [Int] = []
        //let b:Int? = Int(secondText.text)
        
        for var token in question.tokens
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
    
    
    func questionFactory(_ factor: Int, _ lowestDigit: Int, _ highestDigit: Int) -> () -> [Question]
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
                //questions.append((0, (firstFactor, secondFactor)))
            }
            
            secondFactor = factor
            
            for firstFactor in lowestDigit...highestDigit
            {
                let q = Question()
                q.tokens.append(String(firstFactor))
                q.tokens.append("x")
                q.tokens.append(String(secondFactor))
                
                questions.append(q)
                //questions.append((0, (firstFactor, secondFactor)))
            }
        
            return questions
        }
        
        return generate
    }
}
