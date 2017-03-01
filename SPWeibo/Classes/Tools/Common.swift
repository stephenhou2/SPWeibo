//
//  File.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/27.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit


let WBSwitchRootViewControllerNotification = Notification.Name.init(rawValue: "WBSwitchRootViewControllerNotification")

let kSPTintColor = UIColor.orange

// 获取沙盒中document文件的路径
let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!

enum WBSwitchRootViewControllerFlag {
    case WBWelcomeFinishedFlag
    case WBNewFeatureFinishedFlag
    case WBOAuthfinishedFlag
}
