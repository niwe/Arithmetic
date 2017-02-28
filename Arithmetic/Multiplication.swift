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
    
    
    func questionFactory(_ factor: Int, _ lowestDigit: Int, _ highestDigit: Int) -> () -> [(used: Int, (firstNumber:Int, secondNumber:Int))]
    {
        func generate() -> [(used: Int, (firstNumber:Int, secondNumber:Int))]
        {
            var firstFactor: Int
            var secondFactor: Int
            var questions: [(used: Int, (firstNumber:Int, secondNumber:Int))] = []
            
            firstFactor = factor
            
            for secondFactor in lowestDigit...highestDigit
            {
                questions.append((0, (firstFactor, secondFactor)))
            }
            
            secondFactor = factor
            
            for firstFactor in lowestDigit...highestDigit
            {
                questions.append((0, (firstFactor, secondFactor)))
            }
        
            return questions
        }
        
        return generate
    }
    
    
    func questionFactory3(_ factor: Int) -> () -> (firstNumber:Int, secondNumber:Int)
    {
        func question() -> (firstNumber:Int, secondNumber:Int)
        {
            let constant: Int = factor
            var firstNumber: Int
            var secondNumber: Int

                if Int(arc4random_uniform(2)) > 0
                {
                    firstNumber = constant
                    secondNumber = Int(arc4random_uniform(10))
                }
                else
                {
                    firstNumber = Int(arc4random_uniform(10))
                    secondNumber = constant
                }
            
            questionHistory.append((" ", (firstNumber: firstNumber, secondNumber: secondNumber)))
    
            return (firstNumber, secondNumber)
        }
        
        //let q = question
        
        //questionHistory.append(q())
        
        return question
        //return (firstNumber, secondNumber)
    }

}
