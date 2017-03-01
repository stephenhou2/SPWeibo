//
//  UserAcount.swift
//  SPWeibo
//
//  Created by 侯亮宏 on 17/2/28.
//  Copyright © 2017年 侯亮宏. All rights reserved.
//

import Foundation

class UserAccount:NSObject,NSCoding{

    /// 用户账户相关属性
    // token
    var access_token:String?
    // token过期时间
    var expires_in:Double = 0{
        didSet{
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    // token过期日期
    var expires_date:NSDate?
    // uid
    var uid:String?
    // 用户昵称
    var screen_name:String?
    // 用户头像地址（大图），180×180像素
    var avatar_large:String?
    // 用户头像地址（中图），50×50像素
    var profile_image_url:String?
    
    var isExpired:Bool{
        return expires_date?.compare(Date()) != ComparisonResult.orderedAscending
    }
    
    static let userAccountFilePath:String = {
               // 取得用户账号存储路径
        return (docPath as NSString).appendingPathComponent("account.plist")
    }()
    
//    override init() {
//        super.init()
//        self = NSKeyedUnarchiver.unarchiveObject(withFile:userAccountFilePath) as? UserAccount
//    }
    
    static let sharedAccount:UserAccount? = NSKeyedUnarchiver.unarchiveObject(withFile:userAccountFilePath) as? UserAccount
    
    /// 字典转模型的初始化方法
    init(dic:Dictionary<String,AnyObject>){
        // 初始化从父类继承的属性
        super.init()
        setValuesForKeys(dic)
    }
    
    // 重写setValue: forUndefinedKey: 防止字典转模型过程中由于键值不匹配抛出异常
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    func addDetailInfo(dic:[String:AnyObject]){
        setValuesForKeys(dic)
    }
    
    override var description: String {
        
        let keys = ["access_token", "expires_in", "expires_date", "uid", "screen_name", "avatar_large", "profile_image_url"]
        
        return dictionaryWithValues(forKeys: keys).description
    }
    
    
    
    /// 键值编码
    // 编码
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_date, forKey: "expires_date")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(profile_image_url, forKey: "profile_image_url")
    }
    
    // 解码
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_date = aDecoder.decodeObject(forKey: "expires_date") as? NSDate
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        profile_image_url = aDecoder.decodeObject(forKey: "profile_image_url") as? String
        
    }

    
}

/// MARK: -用户数据读写操作方法
extension UserAccount{
    
    
    // 用户账号信息写入到磁盘
    func saveUserAccount(success:()->(),failure:()->()){
        
        if (NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.userAccountFilePath) == false){
            failure()
        }
        success()
    }

    
}

