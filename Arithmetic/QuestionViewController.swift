//
//  QuestionViewController.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController
{
    var arithmetic: Arithmetic?
    var preDifficulty: Difficulty?
    var currentQuestion: Question?
    var questions: [Question] = []
    var passStreak: Int = 0
    var failStreak: Int = 0
    var passStreakWas: Int = 0
    var failStreakWas: Int = 0
    
    var failColor: UIColor = UIColor(red:0.83, green:0.10, blue:0.10, alpha:1.0)
    var passColor: UIColor = UIColor(red:0.11, green:0.83, blue:0.10, alpha:1.0)
    
    @IBOutlet weak var textQuestion: UILabel!
    @IBOutlet weak var inputAnswer: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet weak var textResult: UILabel!
    @IBOutlet weak var textPassCount: UILabel!
    @IBOutlet weak var textFailCount: UILabel!
    @IBOutlet weak var textNumber2: UILabel!
    @IBOutlet weak var textNumber1: UILabel!
    
    @IBOutlet weak var textReaction: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.title = preDifficulty!.title
        
        textResult.text = ""
        inputAnswer.text = ""
        
        inputAnswer.layer.cornerRadius = 8.0
        inputAnswer.layer.masksToBounds = true
        inputAnswer.layer.borderColor = UIColor( red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0 ).cgColor
        inputAnswer.layer.borderWidth = 1
        
        questions = preDifficulty!.function()
        
        //inputAnswer.resignFirstResponder()
        
        inputAnswer.becomeFirstResponder()
        
        
        
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(QuestionViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
        
        getNewQuestion()
        textQuestion.text = currentQuestion!.renderQuestion()
    }
    
    @IBAction func editingDidEndTriggered(_ sender: Any)
    {
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        self.view.endEditing(true);
        return false;
    }
    
    func didTapView()
    {
        checkAnswer()
        //self.view.endEditing(true)
        inputAnswer.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonClick(_ sender: Any)
    {
        checkAnswer()
    }
    
    @IBAction func inputPrimaryActionTriggered(_ sender: Any)
    {
        checkAnswer()
    }
    
    func checkAnswer()
    {
        let answer = Int(inputAnswer.text!)
        
        if answer != nil
        {
            let product = arithmetic!.calculate(question: currentQuestion!)
        
            if product == Int(answer!)
            {
                let passCount = Int(textPassCount.text!)!
                passStreak += 1
                passStreakWas = passStreak
                failStreak = 0
            
                textResult.textColor = passColor
                textResult.text = "Rätt"
                textPassCount.text = String(passCount + 1)
                
                if passStreak > 99
                {
                    textReaction.text = "😱"
                }
                else if passStreak > 49
                {
                    textReaction.text = "🤓"
                }
                else if passStreak > 19
                {
                    textReaction.text = "😎"
                }
                else if passStreak > 10
                {
                    textReaction.text = "😁"
                }
                else if passStreak > 7
                {
                    textReaction.text = "😀"
                }
                else if passStreak > 4
                {
                    if failStreakWas > 1
                    {
                        textReaction.text = "🙂"
                    }
                    else
                    {
                        textReaction.text = "😀"
                    }
                }
                else
                {
                    if failStreakWas > 9
                    {
                        textReaction.text = "😮"
                        failStreakWas = 9
                    }
                    else if failStreakWas > 6
                    {
                        textReaction.text = "😕"
                        failStreakWas = 6
                    }
                    else if failStreakWas > 3
                    {
                        textReaction.text = "😐"
                        failStreakWas = 3
                    }
                    else
                    {
                        textReaction.text = "🙂"
                    }
                }
            }
            else
            {
                let failCount = Int(textFailCount.text!)!
                failStreak += 1
                failStreakWas = failStreak
                passStreak = 0
            
                textResult.textColor = failColor
                textResult.text = "Fel\n(\(textQuestion.text!) = \(product))"
                textFailCount.text = String(failCount + 1)
                
                if failStreak == 66
                {
                    textReaction.text = "👿"
                }
                else if failStreak > 9
                {
                    textReaction.text = "😵"
                }
                else if failStreak > 5
                {
                    textReaction.text = "😣"
                }
                else if failStreak > 2
                {
                    textReaction.text = "😩"
                }
                else if failStreak > 1
                {
                    if passStreakWas > 49
                    {
                        textReaction.text = "😭"
                    }
                    else if passStreakWas > 9
                    {
                        textReaction.text = "😞"
                    }
                    else
                    {
                        textReaction.text = "☹️"
                    }
                }
                else
                {
                    if passStreakWas > 49
                    {
                        textReaction.text = "😤"
                    }
                    else if passStreakWas > 9
                    {
                        textReaction.text = "😳"
                    }
                    else
                    {
                        textReaction.text = "🙁"
                    }
                }
            }
        
            inputAnswer.text = ""
        
            getNewQuestion()
            textQuestion.text = currentQuestion!.renderQuestion()
        }
        else
        {
            textReaction.text = "🤔"
        }
    }
    
    func getNewQuestion()
    {
        let questionUsage = questions.map({$0.useCount})
        var filter = questionUsage.max()!
        var rnd: Int = 0
        
        if questionUsage.max() == questionUsage.min()
        {
            filter += 1
        }
        
        let q = questions.filter({
            $0.useCount < filter
        })
        
        repeat
        {
            rnd = Int(arc4random_uniform(UInt32(q.count)))
        }
        while (q[rnd] === currentQuestion)
        
        self.title = String(filter)
        
        currentQuestion = q[rnd]
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
