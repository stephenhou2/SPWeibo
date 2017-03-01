//
//  UIButton+Extension.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit


extension UIButton{
    convenience init(imageName:String,backGroundImageName:String){
    
    self.init()
    
    self.setImage(UIImage(named: imageName), for: UIControlState.normal)
    self.setImage(UIImage(named: imageName + "_hightlighted"), for: .highlighted)
    
    self.setBackgroundImage(UIImage(named: backGroundImageName), for: UIControlState.normal)
    self.setBackgroundImage(UIImage(named: backGroundImageName + "_highlighted"),for: .highlighted)
    
    self.sizeToFit()

    }
    
    convenience init(backGroundImageName:String,title:String,color:UIColor){
        self.init()
        setBackgroundImage(UIImage(named:backGroundImageName), for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
    }
    
    
}
