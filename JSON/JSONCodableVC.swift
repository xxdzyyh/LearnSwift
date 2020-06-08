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
    var detail : String?
}

struct Base : Codable {
    var userId : NumberType
    var name : Name?
    var age : Int?
    
    // 自定义key
    enum CodingKeys:String, CodingKey {
        case userId = "id"
        case age
        case name
    }
}

struct User : Codable {
    var base : Base 
    var address : [Address]?
}

struct NumberType : Codable {
    var intValue : Int {
        didSet {
            let value = String(intValue)
            if value != stringValue {
                stringValue = value
            }
        }
    }
    
    var stringValue : String {
        didSet {
            let value = Int(stringValue)
            if value != intValue {
                intValue = value ?? 0
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
        
        if let value = try? singleValueContainer.decode(String.self) {
            stringValue = value
            intValue = Int(stringValue) ?? 0
        } else if let value = try? singleValueContainer.decode(Int.self) {
            intValue = value
            stringValue = String(intValue)
        } else {
            intValue = 0
            stringValue = ""
        }
    }
}

class JSONCodableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // json to model
        let jsonDecoder = JSONDecoder()
        let model: User = try! jsonDecoder.decode(User.self, from: testData() as Data)
        
        print(model.base.userId)
        print(model.base.age)
        print(model.address?.first?.detail)
        
        // model to json
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(model)
        
    }
    
    func testData() -> NSData! {
        let path : String = Bundle.main.path(forResource: "user", ofType: "json")!
        let data = NSData(contentsOfFile: path)
        
        return data
    }
}
