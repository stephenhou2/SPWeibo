//
//  WelcomeViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/3/1.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    // 背景图片view
    lazy var backgroundImageView = UIImageView(image: UIImage(named: "ad_background"))
    
    // 头像view
    lazy var iconView = UIImageView(image:UIImage(named: "avatar_default_big"))
    
    // 用户昵称label
    lazy var textLabel = UILabel(text: "欢迎回来", color: UIColor.darkGray, fontSize: 14)

    // 本地读取的用户账户
    lazy var userAccountLocal:UserAccount? = UserAccount.sharedAccount
    
    // 背景图片view加载为欢迎界面的根视图
    override func loadView() {
        self.view = backgroundImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(iconView)
        self.view.addSubview(textLabel)
        
        // 设置登录头像
        iconView.sd_setImage(with: URL.init(string: (userAccountLocal?.avatar_large) ?? ""), placeholderImage: UIImage(named: "avatar_default_big"))
        // 设置用户昵称
        textLabel.text = userAccountLocal?.screen_name
        
        // 设置控件布局和样式
        setupIconView()
        setupTextLabel()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        /// 在viewDidAppear中适合做动画和键盘处理
        super.viewDidAppear(animated)

        self.iconView.snp.updateConstraints({ (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-0.7 * view.bounds.size.height)
         })
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: [], animations: {
            // 设置头像动画
            self.view.layoutIfNeeded()
        }) { (result) in
            // 设置label显示动画
                UIView.animate(withDuration: 0.5, animations: { 
                    self.textLabel.alpha = 1.0
                })
            NotificationCenter.default.post(name: WBSwitchRootViewControllerNotification, object: WBSwitchRootViewControllerFlag.WBWelcomeFinishedFlag)
            
        }
    }
    
    deinit{
        print("WelcomeViewController deinit")
    }

}

extension WelcomeViewController{
    
    // 设置头像的布局和样式
    fileprivate func setupIconView(){
        
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-0.3 * view.bounds.size.height)
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
        iconView.layer.cornerRadius = 45
        iconView.layer.masksToBounds = true
        
        iconView.sizeToFit()
        
        
    }
    // 设置label的布局和样式
    fileprivate func setupTextLabel(){
        textLabel.alpha = 0.0
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(16)
            make.centerX.equalTo(iconView.snp.centerX)
        }

    }
    
}
