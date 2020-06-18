//
//  CircleProgressVC.swift
//  LearnSwift
//
//  Created by sckj on 2020/6/18.
//  Copyright © 2020 yunmai. All rights reserved.
//

import UIKit

class CircleProgressVC: UIViewController {

    lazy var progressView: CircleProgressView = {
        return CircleProgressView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.progressView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(self.progressView)
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.progressView.progress = self.progressView.progress + 0.05
            self.progressView.staticTip = String.init(format: "%d",Int(self.progressView.progress*100)).appending("%")
        }
    }

}
