import UIKit

// 产品
class Product {
    var price = 0.0
    
    required init(price:Double) {
        self.price = price
    }
}

// 支付,原价，打折，满100减20
class PayVC {
    
    func totalPrice(products:[Product], withType type :String) -> Double {
        var total = 0.0
        switch type{
        case "原价":
            
            for product in products {
                total += product.price
            }
            
        case "打9折":
            
            for product in products {
                total += product.price
            }
            
            total = total * 0.9
            
        case "满100减20":
            
            for product in products {
                total += product.price
            }
            
            if (total >= 100) {
                total -= 20
            }
            
        default:
            
            for product in products {
                total += product.price
            }
            
        }
        
        return total
    }
}

let p1 = Product(price: 12.8)
let p2 = Product(price: 7.2)
let p3 = Product(price: 11.0)

let vc = PayVC()

vc.totalPrice(products: [p1,p2,p3], withType: "打9折")
