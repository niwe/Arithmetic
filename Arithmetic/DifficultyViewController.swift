//
//  DifficultyViewController.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DifficultyViewController: UICollectionViewController
{
    //@IBOutlet weak var difficultyLabel: UILabel!
    
    var preArithmetic:Arithmetic?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        //self.title = preArithmetic?.title
        
        
        preArithmetic!.difficulties.removeAll()
        preArithmetic!.questionHistory.removeAll()
        
        
        
        if (preArithmetic?.id == "multi")
        {
            preArithmetic!.setup()
            
            //for difficulty in (preArithmetic?.difficulties)!
            //{
             //   DifficultyManager.AddDifficulty(id, title)
            //}
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        //return DifficultyManager.difficulty.count
        return preArithmetic!.difficulties.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customcell2", for: indexPath) as! DifficultyCell
    
        // Configure the cell
        //cell.title.text = DifficultyManager.difficulty[indexPath.item].title
        //cell.difficulty = DifficultyManager.difficulty[indexPath.item]
        cell.title.text = preArithmetic!.difficulties[indexPath.item].title
        cell.difficulty = preArithmetic!.difficulties[indexPath.item]
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "toQuestionnaireView")
        {
            let cell = sender as! DifficultyCell
            let questionView = segue.destination as! QuestionViewController
            
            questionView.preDifficulty = cell.difficulty
            
            //let test = ""
        }
    }
    
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        if (segue.identifier == "toDifficultyView")
        {
            let cell = sender as! ArithmeticCell
            let difficultyView = segue.destination as! DifficultyViewController
     
            difficultyView.preArithmetic = cell.arithmetic
        }
     }
     */
 
 

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
