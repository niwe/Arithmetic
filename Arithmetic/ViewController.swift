//
//  ViewController.swift
//  Arithmetic
//
//  Created by Nicklas on 2017-01-29.
//  Copyright © 2017 Nicklas. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController
{
    let array = ["item1", "item2", "item3", "item4"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ArithmeticManager.AddArithmetic(id: "add", title: "Plus", symbol: "+")
        ArithmeticManager.AddArithmetic(id: "sub", title: "Minus", symbol: "-")
        ArithmeticManager.AddArithmetic(id: "multi", title: "Gånger", symbol: "x")
        ArithmeticManager.AddArithmetic(id: "div", title: "Delat", symbol: "/")
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return array.count
    }
    
    
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customcell", for: indexPath) as! ArithmeticCell
        
        let arithmetic = ArithmeticManager.arithmetics[indexPath.item]
        cell.title.text = arithmetic.title
        cell.arithmetic.text = arithmetic.symbol
        
        return cell
    }
}

