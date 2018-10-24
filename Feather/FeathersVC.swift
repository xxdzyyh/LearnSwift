//
//  FeathersVCViewController.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/21.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class FeathersVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    var dataSource: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [["ClosuresVC","闭包"],["类属性多态","输出"]];
        
        setupTableView()
        self.view.addSubview(self.tableView!)
        self.tableView.frame = self.view.bounds
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 60
    }
    
    ///MARK
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell");
        
        if cell == nil {
            cell = UITableViewCell.init(style:UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        
        let item = self.dataSource[indexPath.row] as! NSArray;
        
        cell?.textLabel?.text = item[0] as? String
        cell?.detailTextLabel?.text = item[1] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.dataSource[indexPath.row] as! NSArray;
        
        let className = item[0] as! String
        
        if className == "ClosuresVC" {
            let obj = RuntimeHelper.instanceForClassName(className)
            
            self.navigationController?.pushViewController(obj as! UIViewController, animated: true)
        } else if (className == "类属性多态") {
            
            XTokenRequest.domain = "XTokenRequest.domain"
            XBaseRequest.domain = "XBaseRequest.domain"
            
            // 子类和父类的domain实际是同一个对象，虽有输出的值看赋值的顺序
            XTokenRequest.init().url()
        }
    
    }

}
