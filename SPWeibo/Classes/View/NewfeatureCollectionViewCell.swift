//
//  NewfeatureCollectionViewCell.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/28.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit
import SnapKit

class NewfeatureCollectionViewCell: UICollectionViewCell {
    
    /// 设置属性观察器，当imageName被赋值之后刷新UI
    var imageName:String?{
        didSet{
            imageView.image = UIImage(named: imageName!)
            imageView.frame = bounds
        }
    }
    
    private lazy var imageView = UIImageView()
    
    
    static let newfeatureButtonImageName = "new_feature_finish_button"
    
    lazy var newfeatureButton = UIButton(backGroundImageName: newfeatureButtonImageName, title: "欢迎", color: UIColor.white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: frame)
        addSubview(imageView)
        addSubview(newfeatureButton)
        setupNewfeatureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

/// MARK: -定制NewfeatureCollectionViewCell的外观
extension NewfeatureCollectionViewCell{
    
    fileprivate func setupNewfeatureButton(){
        newfeatureButton.isHidden = true
        newfeatureButton.sizeToFit()
        newfeatureButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).multipliedBy(0.8)
        }
       
    }
       
}
