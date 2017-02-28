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
    var preDifficulty: Difficulty?
    //var currentQuestion: Question?
    var questions: [(used: Int, (firstNumber:Int, secondNumber:Int))] = []
    
    @IBOutlet weak var textQuestion: UILabel!
    @IBOutlet weak var inputAnswer: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet weak var textResult: UILabel!
    
    @IBOutlet weak var textNumber2: UILabel!
    @IBOutlet weak var textNumber1: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        questions = preDifficulty!.function()
        
        
        
        let question = getNewQuestion()
        
        // Do any additional setup after loading the view.
        
        //textQuestion.text = preDifficulty!.title
        
        textNumber1.text = "\(question.firstNumber)"
        textNumber2.text = "\(question.secondNumber)"
        textQuestion.text = "x"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonClick(_ sender: Any)
    {
        
        
        
        let question = getNewQuestion()
        textNumber1.text = "\(question.firstNumber)"
        textNumber2.text = "\(question.secondNumber)"
        textQuestion.text = "x"
    }
    
    func getNewQuestion() -> (firstNumber:Int, secondNumber:Int)
    {
        let questionUsage = questions.map({$0.used})
        var filter = questionUsage.max()!
        
        if questionUsage.max() == questionUsage.min()
        {
            filter += 1
        }
        
        
        let q = questions.filter({
            $0.used < filter
        })
        
        let rnd = Int(arc4random_uniform(UInt32(q.count)))
        
        let question = questions[rnd].1
        
        return question
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
