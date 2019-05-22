//
//  JSONVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/5/22.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit

struct Name : Codable {
    var first : String?
    var last : String?
}

struct Address : Codable {
    var desc : String
    var detail : String
}

struct Base : Codable {
    var id : String
    var name : Name?
}

struct User : Codable {
    var base : Base 
    var address : [Address]?
}

class JSONVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonDecoder = JSONDecoder()
        let model: User = try! jsonDecoder.decode(User.self, from: testData()! as Data)
        
        print(model.base.id)
        print(model.address?.first?.detail as Any)
    }
    
    func testData() -> NSData? {
        
        let path : String = Bundle.main.path(forResource: "user", ofType: "json")!
        let data = NSData(contentsOfFile: path)
        
        return data
    }
}
