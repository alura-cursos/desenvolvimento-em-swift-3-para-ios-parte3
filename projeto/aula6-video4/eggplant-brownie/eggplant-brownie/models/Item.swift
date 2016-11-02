import Foundation

class Item: NSObject, NSCoding {
    
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories;
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey : "name") as! String
        self.calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey : "name")
        aCoder.encode(calories, forKey : "calories")
    }
    
    
}
func ==(first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
}

