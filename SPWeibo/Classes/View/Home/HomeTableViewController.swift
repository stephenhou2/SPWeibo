//
//  HomeTableViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitor?.setupSubviews(name:"visitordiscover_feed_image_house",
                               backImg:"visitordiscover_feed_image_smallicon" ,
                               title: "关注一些人，回这里看看有什么惊喜")
        
    }

   }
