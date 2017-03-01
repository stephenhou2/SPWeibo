//
//  VisitorViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class VisitorViewController: UITableViewController {
    
    var hasLogon:Bool{
        if ( UserDefaults.standard.value(forKey: "hasLogon") != nil){
            return true
        }
        return false
    }
    var isExpired:Bool{
        if (UserDefaults.standard.value(forKey: "isExpired") != nil){
            return false
        }
        return true
    }
    
    var visitor:VisitorView?
    
    override func loadView() {
        (hasLogon && !(isExpired)) ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(loginClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(registerClicked))
        
    }
    
    fileprivate func setupVisitorView(){
        visitor = VisitorView(frame:UIScreen.main.bounds)
        view = visitor
    }
    
    deinit{
        print("VisitorViewController deinit")
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
