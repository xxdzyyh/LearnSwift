//
//  SnapkitDemo.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/8.
//  Copyright © 2019 yunmai. All rights reserved.
//

import Foundation
import SnapKit

class SnapKitDemoVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
        self.setupLayout()
    }
    
    func setupSubviews() {
        self.view.addSubview(self.redView)
        self.view.addSubview(self.yellowView)
        self.view.addSubview(self.greenView)
        self.view.addSubview(self.grayView)
    }
    
    func setupLayout() {
        /*!
         因为没有其他的参数，只有一个闭包作为参数，所以使用尾随闭包后，()被省略了，也可以不省略
         */
        self.redView.snp.makeConstraints { (snp) in
            snp.centerX.equalToSuperview()
            snp.top.equalTo(50)
            snp.size.equalTo(100)
        }
        
        
        self.grayView.snp.makeConstraints() { (make) in
            make.top.equalTo(self.redView.snp_bottomMargin).offset(10)
            make.size.equalTo(self.redView)
            make.centerX.equalToSuperview()
        }

        
    }
    
    /// Mark - Property
    lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        return redView;
    }()
    
    lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        return yellowView;
    }()
    
    lazy var greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = UIColor.red
        return greenView;
    }()
    
    lazy var grayView: UIView = {
        let grayView = UIView()
        grayView.backgroundColor = UIColor.yellow
        return grayView;
    }()
}
