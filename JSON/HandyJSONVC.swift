//
//  HandyJSONVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/5/24.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit
import HandyJSON

struct HName : HandyJSON {
    var first : String?
    var last : String?
    
    init() {
        
    }
}

struct HAddress : HandyJSON {
    var desc : String?
    var detail : String?
    
    init() {
        
    }
}

struct HBase : HandyJSON {
    var id : Int?
    var name : HName?
    var age : Int?
    
    init() {
        
    }
}

struct HUser : HandyJSON {
    var index : Int = 0
    var base : HBase? 
    var address : [HAddress]?
    
    init() {
        
    }
}

class HandyJSONVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let object = try? JSONSerialization.jsonObject(with: testData() as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
        
        let user = HUser.deserialize(from: object as? NSDictionary)
        
        print(user?.base?.name)
    }
    
    func testData() -> NSData! {
        let path : String = Bundle.main.path(forResource: "user", ofType: "json")!
        let data = NSData(contentsOfFile: path)
        
        return data
    }
    
    func testMemoryLayout() {
        let user = HUser()
        
        let size = MemoryLayout.size(ofValue: user)
        let stride = MemoryLayout.stride(ofValue: user);
        let aligment = MemoryLayout.alignment(ofValue: user)
        
        print(size)
        
        
        let sizeClass = MemoryLayout<HUser>.size
        
    }
    
}
