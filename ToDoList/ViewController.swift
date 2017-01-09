//
//  ViewController.swift
//  ToDoList
//
//  Created by HChlebek on 11/22/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate
{

    @IBOutlet weak var myCollectionView: UICollectionView!

    
    var catagories = [CatagoryCell]()
    var pics = ["grocery-trolley","homework","iron","shopping-bag"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return pics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "catagory", for: indexPath) as! CatagoryCell
        
        let catagory = pics[indexPath.item]
        
        
        cell.myImage.image = UIImage(named: catagory)

        return cell
    }
    

}

