//
//  MainViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    fileprivate lazy var postBtn:UIButton = UIButton(imageName: "tabbar_compose_icon_add",
                                                 backGroundImageName: "tabbar_compose_button")

    
    static let sharedMainVC = MainViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置底部tabbar
        setupTabBar()
        setupPostBtn()
        
        // 开始界面设置为主页
        self.selectedIndex = 0
    }
    
    // 将postBtn放到tabbar最上面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBar.bringSubview(toFront: postBtn)
    }
    
    
 }

extension MainViewController{
    
    // MARK: - 设置底部tabbar
    /// 添加各主要controller
    fileprivate func setupTabBar(){
        
        // 设置tabbarItem选中颜色
        tabBar.tintColor = UIColor.orange
        // 设置tabbarItem之间的间距
        tabBar.itemSpacing = 0
        
        addController(name:"tabbar_home", title:"主页", vc: HomeTableViewController())
        addController(name: "tabbar_message_center", title: "消息", vc: MessageTableViewController())
        addChildViewController(UIViewController())
        addController(name: "tabbar_discover", title: "发现", vc: DiscoverTableViewController())
        addController(name: "tabbar_profile", title: "我的", vc: ProfileTableViewController())
    }

    // MARK: -设置tabbar上的item
    private func addController(name:String,title:String,vc:UIViewController){
        
        //        let tabbarItem = UITabBarItem()
        //        tabbarItem.image = UIImage(named: name)
        
        let nav = UINavigationController(rootViewController: vc)
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: name)
        
        addChildViewController(nav)
    }
    fileprivate func setupPostBtn() {
        let itemWidth = tabBar.frame.size.width / 5
        
        postBtn.frame = tabBar.bounds.insetBy(dx: 2 * itemWidth, dy: 0)
        
        tabBar.addSubview(postBtn)
    }
    
    
}
