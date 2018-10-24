//
//  XBaseRequest.swift
//  LearnSwift
//
//  Created by xiaoniu on 2018/10/24.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class XBaseRequest: NSObject {
    static var domain : String?
    
    var path : String?
    
    func url() {
        print("\(XBaseRequest.domain ?? "")\(path ?? "")")
    }
    
}

