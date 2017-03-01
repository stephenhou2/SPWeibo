//
//  AppDelegate.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import AFNetworking




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        
        
        let vc = self.accessVCJudgeBy()
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()

        // 注册切换主视图的根控制器请求的通知
        NotificationCenter.default.addObserver(forName: WBSwitchRootViewControllerNotification, object: nil, queue: nil) { (notification) in
            let flag = notification.object as! WBSwitchRootViewControllerFlag
            switch flag{
            case .WBNewFeatureFinishedFlag:
                application.keyWindow?.rootViewController = WelcomeViewController()
            case .WBWelcomeFinishedFlag:
                application.keyWindow?.rootViewController = MainViewController()
            case .WBOAuthfinishedFlag:
                application.keyWindow?.rootViewController = MainViewController()
            }
            
        }

        // 设置全局的状态栏外观
        setAppearance()
        
        return true
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: WBSwitchRootViewControllerNotification, object: nil)
    }
 
}


extension AppDelegate{
    
    //／ 判断入口控制器
    fileprivate func accessVCJudgeBy() -> UIViewController {
        
        // 从UserDefaults中提取所需的判断入口控制器的相关信息
        let isFirstOpen = UserDefaults.standard.value(forKey: "isFirstOpen") as? Bool
        
        if isFirstOpen == nil{
            // 说明是第一次使用app
            return NewfeatureCollectionViewController()
        }
//        if hasLogon == nil || isExpired == nil{
//            // 说明还没有登录过或者登录已经过期
//            return VisitorViewController()
//        }
        // 能来到这说明不是第一次使用app，且不需要登录
        return WelcomeViewController()
    }
    
    //／: -定义全局外观方法
    fileprivate func setAppearance(){
        
        UITabBar.appearance().tintColor = kSPTintColor
        UITabBar.appearance().isOpaque = true
        
        UINavigationBar.appearance().tintColor = kSPTintColor
        UINavigationBar.appearance().isOpaque = true
        
        
        // 使用网络时状态栏加载菊花
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
    }
   
    
}




