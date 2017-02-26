//
//  NetworkTool.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/26.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTool: AFHTTPSessionManager {

    /// 创建AFUrlSessionManager的单例管理工具类
    static let networkTool:NetworkTool = {
        let config = URLSessionConfiguration()
        config.timeoutIntervalForRequest = 15
        let url:URL = URL(string: "http:httpbin.org/")!
        let networkTool:NetworkTool = NetworkTool(baseURL: url, sessionConfiguration: config)
        return networkTool
    }()
    
    
    
    
    
//    func request(requestMethod:String ,parameters:id , finishted:()) -> <#return type#> {
//        <#function body#>
//    }
//    GET:(NSString *)URLString
//    parameters:(nullable id)parameters
//    success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
//    failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
//    
    
    
}

// MARK: - 网络工具封装的方法
extension NetworkTool{
    
}
