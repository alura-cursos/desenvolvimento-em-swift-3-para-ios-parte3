import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ message:String) {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
}
