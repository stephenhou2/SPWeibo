//
//  MessageTableViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/24.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

class MessageTableViewController: VisitorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitor?.setupSubviews(name: "visitordiscover_image_message",
                               backImg: nil ,
                               title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
    }
}
