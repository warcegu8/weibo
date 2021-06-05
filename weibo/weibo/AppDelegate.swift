//
//  AppDelegate.swift
//  weibo
//
//  Created by 张衡 on 15/7/28.
//  Copyright © 2015年 张衡. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window?.backgroundColor = UIColor.whiteColor()
        
        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

