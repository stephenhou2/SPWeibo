//
//  UIButton+Extension.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit


extension UIButton{


    convenience init(name:String,backGroundName:String){
    
    self.init()
    
    self.setImage(UIImage(named: name), for: UIControlState.normal)
    self.setImage(UIImage(named: name + "_hightlighted"), for: .highlighted)
    
    self.setBackgroundImage(UIImage(named: backGroundName), for: UIControlState.normal)
    self.setBackgroundImage(UIImage(named: backGroundName + "_highlighted"),for: .highlighted)
    
    self.sizeToFit()

    }
}
