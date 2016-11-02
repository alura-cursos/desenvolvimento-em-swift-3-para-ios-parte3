//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Alura on 10/28/16.
//  Copyright © 2016 Alura. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller:UIViewController
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ meal:Meal, handler: @escaping (UIAlertAction) -> Void) {
        
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.alert)
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.destructive, handler: handler)
        details.addAction(remove)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        details.addAction(cancel)
        
        controller.present(details, animated: true, completion: nil)
    }
}
