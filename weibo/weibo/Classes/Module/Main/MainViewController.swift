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
        // 无处不在懒加载，此时，tabBarButton 还没有创建
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        // 此时tabBatButton 都已经创建
        setUpComposeButton()
    }
    
    // 撰写按钮位置
    private func setUpComposeButton() {
        let w = tabBar.bounds.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: w, height: tabBar.bounds.height)
        
        // 偏移
        composeButton.frame = CGRectOffset(rect, 2 * w, 0)
    }

    // 添加所有控制器
    private func addChildViewControllers() {
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        // 这一步很关键
        addChildViewController(UIViewController())
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
    

    // 懒加载控件
    lazy private var composeButton: UIButton = {
        // 自定义类型的按钮
        let button = UIButton()
        
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        self.tabBar.addSubview(button)
        button.addTarget(self, action: "clickComposedButton", forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    
    
    func clickComposedButton() {
        print("中间按钮点击了")
    }
    
}
