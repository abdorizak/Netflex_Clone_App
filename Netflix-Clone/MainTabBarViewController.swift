//
//  ViewController.swift
//  Netflix-Clone
//
//  Created by Abdirizak Hassan on 2/16/22.
//

import UIKit
import ProgressHUD
class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let v1 = UINavigationController(rootViewController: HomeViewController())
        let v2 = UINavigationController(rootViewController: UpCommingViewController())
        let v3 = UINavigationController(rootViewController: SearchViewController())
        let v4 = UINavigationController(rootViewController: DownloadViewController())
        
        v1.tabBarItem.image = UIImage(systemName: "house.fill")
        v2.tabBarItem.image = UIImage(systemName: "play.circle")
        v3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        v4.tabBarItem.image = UIImage(systemName: "arrow.down.circle")
        
        tabBar.tintColor = .label
        
        setViewControllers([v1, v2, v3, v4], animated: true)
        
    }


}

