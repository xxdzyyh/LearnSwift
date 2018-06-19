//
//  MasterViewController.swift
//  LearnSwift
//
//  Created by yunmai on 2018/6/19.
//  Copyright © 2018年 yunmai. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Array<Any>]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem
        
        objects = [["MarkDownPreviewVC","MarkDown预览"]];
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object : Array = objects[indexPath.row]
        let className : String = object[0] as! String;
        
        cell.textLabel!.text = className
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object : Array = objects[indexPath.row]
        
        let className : String = object[0] as! String;
        
        if className.hasSuffix("VC") {
            
            let vc = MarkDownPreviewVC();
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

