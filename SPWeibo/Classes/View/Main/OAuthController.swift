//
//  OAuthController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/27.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//


import WebKit

class OAuthController: UIViewController,WKNavigationDelegate,WKUIDelegate{
    
    /// MARK: -微博OAuth授权认证的相关应用信息
    // appKey
    lazy var appKey = "2708932631"
    // appSecrect
    lazy var appSecrect = "e7b57f5ffdd45f8af14d92d9de5e9bc3"
    // redirect
    lazy var appRedirect = "https://www.baidu.com"
    // token
    fileprivate var token:String?
    // authBaseUrl
    lazy var authBaseRul = "https://open.weibo.cn/oauth2/authorize?"
    lazy var statusBaseUrlStr = "https://api.weibo.com/2/statuses/home_timeline.json"
    
    // 提供用于显示授权页面的WKWebView
    lazy var oAuthView = WKWebView(frame: UIScreen.main.bounds)
    

    
    
    
    override func loadView() {
//        super.loadView()
        view = oAuthView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:authBaseRul + "client_id=\(appKey)&redirect_uri=\(appRedirect)")
        oAuthView.load(URLRequest(url: url!))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target:self, action: #selector(cancelClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: UIBarButtonItemStyle.plain, target: self, action: #selector(autoFill))
        
        oAuthView.navigationDelegate = self
        oAuthView.uiDelegate = self
    }
    
    
    
    
    @objc private func cancelClicked(){
        dismiss(animated: true) {
            print("取消")
        }
    }
    @objc private func autoFill(){
        let js = "document.getElementById('userId').value = '18019019585';" +
        "document.getElementById('passwd').value = '199123';"
       oAuthView.evaluateJavaScript(js, completionHandler: nil)
    }

 
}

// MARK: -WKWebView代理方法
extension OAuthController{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        // 获取当前网络请求的url
        let url = navigationAction.request.url
        
        // 如果主机域名为www.baidu.com的话，说明已经授权成功，跳转到回调页面，附带授权的code
        if (url?.host == "www.baidu.com"){
            
            if let code = url?.query?.substring(from: "code=".endIndex){
                
                // 通过code从服务器获取授权的token
                getToken(code: code)
            }
            decisionHandler(.cancel)
            return
        }
        print(url?.host ?? "")
        print(url?.query ?? "")
        decisionHandler(.allow)
    }
    
}

// MARK: -获取相关数据方法
extension OAuthController{
    fileprivate func getToken(code:String){
        
        // 获取token所需要的参数
        let parameters = ["client_id":appKey,
                          "client_secret":appSecrect,
                          "grant_type":"authorization_code",
                          "code":code,
                          "redirect_uri":appRedirect]
        // 向服务器请求tocken的baseURL
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 从服务器获取最新的微博数据
        NetworkManager.sharedManager.request(requestMethod:.POST, url: urlString, parameters: parameters, finished: { (response, error) in
            guard error == nil else{
                print(error!)
                return
            }
            let result = response as! [String:AnyObject]
            self.token = result["access_token"] as! String?
            self.getStatus()
        })
    }
    
    private func getStatus(){
        
        if let token = token{
        NetworkManager.sharedManager.request(requestMethod: .GET, url: statusBaseUrlStr, parameters: ["access_token":token], finished: { (result, error) in
            if error != nil {
                print(error!)
                return
            }
            print(result!)
        })
        }
    }
    
}
