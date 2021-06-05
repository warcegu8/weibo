//
//  MainViewController.swift
//  weibo
//
//  Created by 张衡 on 15/7/29.
//  Copyright © 2015年 张衡. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        
    }

    // 添加所有控制器
    private func addChildViewControllers() {
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(MessageTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    
    
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        
        // 设置tintcolor
        tabBar.tintColor = UIColor.orangeColor()  // 修改默认渲染的颜色
        
        // title属性会从内向外传递设置
        vc.title = title   //上面有，下面也有
        vc.tabBarItem.image = UIImage(named: imageName) // 默认渲染成蓝色的
        let nav = UINavigationController(rootViewController: vc)
        
//        nav.title = "首页"   下面有
        addChildViewController(nav)
    }
    

    
}
