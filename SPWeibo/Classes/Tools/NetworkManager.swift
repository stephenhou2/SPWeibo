//
//  NetworkTool.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/26.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import AFNetworking

enum SPNetRequsetType:String {
    case GET = "GET"
    case POST = "POST"
}



class NetworkManager: AFHTTPSessionManager {

    /// 创建AFUrlSessionManager的单例管理工具类
    static let sharedManager:NetworkManager = {
        let url:URL = URL(string: "https://api.weibo.com/oauth2/authorize/")!
        let sharedManager:NetworkManager = NetworkManager(baseURL: nil)
        sharedManager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return sharedManager
    }()
    
    
    
   
}

// MARK: - 网络工具封装的方法
extension NetworkManager{
    /// 请求方法
    func request(requestMethod:SPNetRequsetType,url:String,parameters:[String:String]?,finished:@escaping (Any?,Error?)->()) {
        Dictionary
        if (requestMethod == .GET){
            NetworkManager.sharedManager.get(url, parameters: parameters, progress: nil, success: { (dataTask, responseObject) in
                // 成功所执行回调
                print((dataTask.currentRequest?.allHTTPHeaderFields)!)
                finished(responseObject, nil)
            })
            {(dataTask:URLSessionDataTask?, error:Error) in
                // 失败所执行回调
                print(error)
                finished(nil,error)
            }
        }
        else{
            NetworkManager.sharedManager.post(url, parameters: parameters, progress: nil, success: { (dataTask, responseObject) in
                // 成功所执行回调
                print((dataTask.currentRequest?.allHTTPHeaderFields)!)
                finished(responseObject, nil)
            })
            {(dataTask:URLSessionDataTask?, error:Error) in
                // 失败所执行回调
                print(error)
                finished(nil,error)
            }
        }
    }

}
