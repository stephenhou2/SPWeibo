//
//  VisitorViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class VisitorViewController: UITableViewController {
    
    lazy var logon:Bool = false
    
    var visitor:VisitorView?
    
    
    override func loadView() {
        logon ? super.loadView() : setupVisitorView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    fileprivate func setupVisitorView(){
        visitor = VisitorView()
        view = visitor
    }
    
}


// MARK: -设置visitorView的页面
extension VisitorViewController{
    
   
    
}
