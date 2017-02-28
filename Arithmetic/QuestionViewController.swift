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

        questions = preDifficulty!.function()
        
        //inputAnswer.resignFirstResponder()
        
        inputAnswer.becomeFirstResponder()
        
        
        getNewQuestion()
        textQuestion.text = currentQuestion!.renderQuestion()
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
            
                textResult.textColor = UIColor.green
                textResult.text = "Rätt"
                textReaction.text = "🙂"
                textPassCount.text = String(passCount + 1)
            }
            else
            {
                let failCount = Int(textFailCount.text!)!
            
                textResult.textColor = UIColor.red
                textResult.text = "Fel\n(\(currentQuestion!.renderQuestion()) = \(answer!))"
                textReaction.text = "🙁"
                textFailCount.text = String(failCount + 1)
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
        
        if questionUsage.max() == questionUsage.min()
        {
            filter += 1
        }
        
        
        let q = questions.filter({
            $0.useCount < filter
        })
        
        let rnd = Int(arc4random_uniform(UInt32(q.count)))
        
        currentQuestion = questions[rnd]
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
