//
//  TableVC.swift
//  ToDoList
//
//  Created by HChlebek on 12/17/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet var myTableView: UITableView!
    
    var listArray : [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let listTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        listTableViewCell.textLabel?.text = listArray[indexPath.row]
        
        return listTableViewCell
    }
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add item?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let myRecipeTextField = myAlert.textFields! [0] as UITextField
            self.listArray.append(myRecipeTextField.text!)
            self.myTableView.reloadData()
            
        }
        myAlert.addAction(addAction)
        myAlert.addTextField { (myRecipeTextField) -> Void in
            myRecipeTextField.placeholder = "Add an item"
        }
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func EditButtonPressed(_ sender: UIBarButtonItem)
    {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let items = listArray[sourceIndexPath.row]
        listArray.remove(at: sourceIndexPath.row)
        listArray.insert(items, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            listArray.remove(at: indexPath.row)
            
            myTableView.reloadData()
    
    }

}
}
