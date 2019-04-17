//
//  CartographyVC.swift
//  LearnSwift
//
//  Created by xiaoniu on 2019/4/17.
//  Copyright © 2019 yunmai. All rights reserved.
//

import UIKit
import Cartography

class CartographyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.yellowView)
        self.view.addSubview(self.blueView)
        self.view.addSubview(self.greenView)
        
        constrain(self.yellowView,self.blueView,self.greenView) { (yellowView,blueView,greenView) in
            
            yellowView.width == (yellowView.superview!.width - 100)
            yellowView.top == yellowView.superview!.top + 50
            yellowView.height == 30
            yellowView.centerX == yellowView.superview!.centerX
            
            blueView.top == yellowView.bottom + 15
            blueView.width == 100
            blueView.height == 100
            blueView.centerX == yellowView.centerX
        }
        
    }

    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    
    lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
}
