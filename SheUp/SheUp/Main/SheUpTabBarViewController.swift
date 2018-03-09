//
//  SheUpTabBarViewController.swift
//  SheUp
//
//  Created by 名品导购网MPLife.com on 2017/12/26.
//  Copyright © 2017年 sweet. All rights reserved.
//

import UIKit

class SheUpTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension SheUpTabBarViewController{
    func createViewControllers() {
        /*
        guard let path = Bundle.main.path(forResource: "cartData.json", ofType: nil),
            let data = NSData(contentsOfFile: path),
//            let dataDic = try? JSONSerialization.jsonObject(with:, options: []) as? [String:Array]
        let dataDic = try? JSONSerialization.jsonObject(with: data as Data, options: []) as![String : AnyObject]
            else{
                
                return
        }
 */
        let homeVC = SheUpHomeViewController()
        homeVC.title = "首页"
        let navHome = UINavigationController(rootViewController: homeVC )
        navHome.tabBarItem.title = "首页"
        navHome.tabBarItem.image = UIImage(named: "iconHomenormal")?.withRenderingMode(.alwaysOriginal)
        navHome.tabBarItem.selectedImage = UIImage(named: "iconHomenormal")?.withRenderingMode(.alwaysOriginal)
        
        let squareVC = SheUpSquareViewController()
        squareVC.title = "广场"
        let navSquare = UINavigationController(rootViewController: squareVC )
        navSquare.tabBarItem.title = "广场"
        navSquare.tabBarItem.image = UIImage(named: "iconSquareNormal")?.withRenderingMode(.alwaysOriginal)
        navSquare.tabBarItem.selectedImage = UIImage(named: "iconSquareNormal")?.withRenderingMode(.alwaysOriginal)
        
//        let discoverVC = SheUpPublicViewController()
//        discoverVC.title = "发现"
//        let navDiscover = UINavigationController(rootViewController: discoverVC )
//        navDiscover.tabBarItem.title = "发现"
//        navDiscover.tabBarItem.image = UIImage(named: "iconMyPageNormal")?.withRenderingMode(.alwaysOriginal)
//        navDiscover.tabBarItem.selectedImage = UIImage(named: "iconMyPageNormal")?.withRenderingMode(.alwaysOriginal)
        
        /*let publicVC = SheUpHomeViewController()
        publicVC.title = "发布"
        let navpublic = UINavigationController(rootViewController: publicVC )
        navpublic.tabBarItem.title = "发布"
        navpublic.tabBarItem.image = UIImage(named: "iconReleaseNormal")?.withRenderingMode(.alwaysOriginal)
        navpublic.tabBarItem.selectedImage = UIImage(named: "iconReleaseNormal")?.withRenderingMode(.alwaysOriginal)*/
        
        let messageVC = SheUpMessageViewController()
        messageVC.title = "消息"
        let navMessage = UINavigationController(rootViewController: messageVC )
        navMessage.tabBarItem.title = "消息"
        navMessage.tabBarItem.image = UIImage(named: "iconMessageNormal")?.withRenderingMode(.alwaysOriginal)
        navMessage.tabBarItem.selectedImage = UIImage(named: "iconMessageNormal")?.withRenderingMode(.alwaysOriginal)
        
        let mineVC = SheUpMineViewController()
        mineVC.title = "我的"
        let navMine = UINavigationController(rootViewController: mineVC )
        navMine.tabBarItem.title = "我的"
        navMine.tabBarItem.image = UIImage(named: "iconMyPageNormal")?.withRenderingMode(.alwaysOriginal)
        navMine.tabBarItem.selectedImage = UIImage(named: "iconMyPageNormal")?.withRenderingMode(.alwaysOriginal)
        tabBar.backgroundImage = UIImage(named: "TabbarBg_Image")
        let tabArray = [navHome,navSquare,navMessage,navMine]
        self.viewControllers = tabArray
        
    }
    
}
