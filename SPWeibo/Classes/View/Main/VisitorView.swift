//
//  VisitorView.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class VisitorView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    override func willMove(toWindow newWindow: UIWindow?) {
        print("游客界面准备显示")
    }
    
    lazy var backView:UIImageView = UIImageView()
    
    lazy var iconView = UIImageView()
    
    lazy var titleLabel:UILabel = {
       let titleLabel =  UILabel()
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize:14)
        titleLabel.textColor = UIColor.darkGray
        titleLabel.textAlignment = NSTextAlignment.center
        return titleLabel
    }()
    
    lazy var register:UIButton = {
        let register = UIButton()
        register.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
        register.setTitle("注册", for: .normal)
        register.setTitleColor(UIColor.darkGray, for: .normal)
        return register
    }()
    
    lazy var login:UIButton = {
        let login = UIButton()
        login.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: .normal)
        login.setTitle("登录", for: .normal)
        login.setTitleColor(UIColor.darkGray, for: .normal)
        return login
    }()
    
    lazy var coverView:UIImageView = {
       let coverView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return coverView
    }()
    
    // MARK: -初始化子控件
    func setupSubviews(name:String,backImg:String?,title:String){
        
        backgroundColor = UIColor(white: 234.0/255.0, alpha: 1.0)
        
        // subviews添加到view上
        
        iconView.image = UIImage(named: name)
        titleLabel.text = title
        
        if let backImg = backImg {
            backView.image = UIImage(named: backImg)
            addSubview(backView)
            addSubview(coverView)
        }
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(register)
        addSubview(login)

        setConstraints(backImg: backImg)
    }
    // 开始动画
    fileprivate func startAni(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        
        anim.toValue = M_PI * 2
        
        anim.repeatCount = MAXFLOAT
        
        anim.duration = 20
        
        anim.isRemovedOnCompletion = false
        
        backView.layer.add(anim, forKey: "rotate")
    }

    
   

}



//MARK: -设置布局约束
extension VisitorView{
    fileprivate func setConstraints(backImg:String?){
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        /// 初始化subViews
        
        if backImg != nil{
            // 背景图片
            addConstraint(.init(item: backView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: backView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
            
            startAni()
            
            
            
            // 遮罩
            addConstraint(.init(item: coverView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            addConstraint(.init(item: coverView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -180))
            
        }
        
        // 房子图片
        addConstraint(.init(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
        
        // 文本框
        addConstraint(.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(.init(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        
        // 注册按钮
        addConstraint(.init(item: register, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: register, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1.0, constant: 0))
        
        addConstraint(.init(item: register, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(.init(item: register, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        // 登录按钮
        addConstraint(.init(item: login, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(.init(item: login, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1.0, constant: 0))
        
        addConstraint(.init(item: login, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(.init(item: login, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        
        
    }

}
