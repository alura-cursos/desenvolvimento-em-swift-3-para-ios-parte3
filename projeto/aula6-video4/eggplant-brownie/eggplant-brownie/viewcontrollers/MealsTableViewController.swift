//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Alura on 26/09/16.
//  Copyright © 2016 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController : UITableViewController, AddAMealDelegate {
    
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Zucchini Muffin", happiness: 3),
                 Meal(name: "Daniela's Cheesecake", happiness: 5)]
    
    func add(_ meal:Meal) {
        print("adding \(meal.name)")
        meals.append(meal)
        
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        print("saving at \(dir)")
        let archive = "\(dir)/eggplant-brownie-meals.dados"
        NSKeyedArchiver.archiveRootObject(meals, toFile: archive)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        print("reading from \(dir)")
        let archive = "\(dir)/eggplant-brownie-meals.dados"

        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: archive) {
            self.meals = loaded as! Array<Meal>
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
        
        
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if(recognizer.state == UIGestureRecognizerState.began) {
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]

                RemoveMealController(controller: self).show(meal, handler : { action in
                    self.meals.remove(at: row)
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    
}














