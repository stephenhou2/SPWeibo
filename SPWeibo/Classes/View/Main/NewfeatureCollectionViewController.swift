//
//  NewfeatureCollectionViewController.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/28.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Newfeature"

class NewfeatureCollectionViewController: UICollectionViewController {

    private let imageCount = 4
    private var currentIndex:Int = 0{
        didSet{
            let index = IndexPath(item: currentIndex, section: 0)
            let cell = collectionView?.cellForItem(at: index) as! NewfeatureCollectionViewCell
            cell.newfeatureButton.isHidden = !(currentIndex == 3)
            newfeatureButtonBeginAnimate(btn: cell.newfeatureButton)
            cell.newfeatureButton.addTarget(self, action: #selector(newfeatureButtonClicked), for: .touchUpInside)
        }
    }
    
    // 欢迎按钮的动画方法
    private func newfeatureButtonBeginAnimate(btn:UIButton){
        btn.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            btn.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    
    @objc private func newfeatureButtonClicked(){

        ///不推荐直接切换主窗口的根控制器，这样会使程序难以维护
//        UIApplication.shared.keyWindow?.rootViewController = MainViewController()

        // 使用通知机制,使更换控制器的入口唯一
        NotificationCenter.default.post(name:WBSwitchRootViewControllerNotification, object: WBSwitchRootViewControllerFlag.WBNewFeatureFinishedFlag)
        
    }

    
    
    deinit {
        print("销毁")
    }
    init(){
        
        /// 设置collectionView的layout
        let layout = UICollectionViewFlowLayout()
        /// 设置layout的相关属性
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal

        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 隐藏顶部状态栏
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
  
        // Register cell classes
        self.collectionView!.register(NewfeatureCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        UserDefaults.standard.setValue(true, forKey: "isFirstOpen")
    }
    

    
    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewfeatureCollectionViewCell
        cell.imageName = "new_feature_\(indexPath.item + 1)"
        cell.backgroundColor = UIColor.white
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! NewfeatureCollectionViewCell).newfeatureButton.isHidden = true
    }
    // MARK: -scroll代理方法
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    }
}




/// MARK: -设置欢迎界面风格
extension NewfeatureCollectionViewController{
    fileprivate func setupUI(){
        collectionView?.bounces = false
        collectionView?.alwaysBounceVertical = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        
        
    }
}

