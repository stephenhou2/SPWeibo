//
//  File.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/3/1.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit


extension UILabel{
    convenience init(text:String,color:UIColor = UIColor.darkGray,fontSize:Int = 14){
        self.init()
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        self.textAlignment = NSTextAlignment.center
        self.sizeToFit()
    }
}
