//
//  NetworkTool.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/26.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkManager: AFHTTPSessionManager {

    /// 创建AFUrlSessionManager的单例管理工具类
    static let sharedManager:NetworkManager = {
        let config = URLSessionConfiguration()
        config.timeoutIntervalForRequest = 15
        let url:URL = URL(string: "http:httpbin.org/")!
        let sharedManager:NetworkManager = NetworkManager(baseURL: url, sessionConfiguration: config)
        return sharedManager
    }()
   
}

// MARK: - 网络工具封装的方法
extension NetworkManager{
    
}
