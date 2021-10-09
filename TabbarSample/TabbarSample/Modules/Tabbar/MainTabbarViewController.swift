//
//  MainTabbarViewController.swift
//  TabbarSample
//
//  Created by Xuân Quỳnh Lê on 2021/10/02.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    private lazy var languageViewController: LanguageViewController = {
        languageViewController = LanguageViewController(nibName: "LanguageViewController", bundle: nil)
        languageViewController.tabBarItem.image  = UIImage(systemName: "globe")
        languageViewController.tabBarItem.title = "Language"
        return languageViewController
    }()
    
    private lazy var notificationViewController: NotificationViewController = {
        notificationViewController = NotificationViewController(nibName: "NotificationViewController", bundle: nil)
        notificationViewController.tabBarItem.image  = UIImage(systemName: "bell")
        notificationViewController.tabBarItem.title = "Notification"
        return notificationViewController
    }()
    
    private lazy var settingViewController: SettingViewController = {
        settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
        settingViewController.tabBarItem.image  = UIImage(systemName: "gear")
        settingViewController.tabBarItem.title = "Setting"
        return settingViewController
    }()
    
    private lazy var homeViewController: HomeViewController = {
        homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.tabBarItem.image  = UIImage(systemName: "house")
        homeViewController.tabBarItem.title = "Home"
        return homeViewController
    }()
          
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [homeViewController, notificationViewController, settingViewController]
    }

    
    
}
