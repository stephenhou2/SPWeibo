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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(loginClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(registerClicked))
        
    }
    
    fileprivate func setupVisitorView(){
        visitor = VisitorView()
        view = visitor
    }
    
}


// MARK: -按钮点击方法
extension VisitorViewController{
    
    
    @objc fileprivate func loginClicked(){
        let nav = UINavigationController(rootViewController: OAuthController())
        present(nav, animated: true, completion: nil)
       
    }
    @objc fileprivate func registerClicked(){
        print("注册页面")
    }
    
       
}

// MARK: -设置导航栏按钮
extension VisitorViewController{
    
}
